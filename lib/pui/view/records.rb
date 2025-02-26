# frozen_string_literal: true

module PUI
  module View
    class Records < Base
      class_attribute :columns, default: []

      private attr_reader :records, :model, :pagination_metadata

      def self.column(title, cell = title)
        columns << {
          title: title.is_a?(Symbol) ? -> { title.to_s.humanize } : title,
          cell: cell.is_a?(Symbol) ? ->(record) { record.public_send(cell) } : cell
        }
      end

      def initialize(records:, model:, pagination_metadata:)
        @records = records
        @model = model
        @pagination_metadata = pagination_metadata
      end

      def view_template
        div(id: 'records-list', data: { controller: 'record-row' })  do
          ul(class: 'list bg-base-100 rounded-box shadow-md', id: dom_id(model, :list)) do
            li(class: 'list-row') do
              columns.each do |column|
                div(class: 'font-bold') { column[:title].call }
              end

              div(class: 'font-bold') { 'Action ' }
            end

            records.each do |record|
              li(
                class: 'list-row hover:bg-base-300 group',
                data: {
                  action: 'click->record-row#showRecord',
                  record_row_id_param: dom_id(record)
                }
              ) do
                columns.each do |column|
                  div { column[:cell].call(record) }
                end

                div(class: 'flex') do
                  show_record_button(
                    record, params: pagination_metadata.params, attrs: buttons_attributes.merge(id: dom_id(record))
                  )
                  edit_record_button(record, **buttons_attributes, params: pagination_metadata.params)
                  delete_record_button(record, params: pagination_metadata.params, attrs: buttons_attributes)
                end
              end
            end
          end

          render PUI::El::Paginator.new(model:, metadata: pagination_metadata, filter_params: {})
        end
      end

      private

      def buttons_attributes = { class: 'scale-0 group-hover:scale-100' }
    end
  end
end
