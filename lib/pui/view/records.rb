# frozen_string_literal: true

module PUI
  module View
    class Records < Base
      class_attribute :columns, default: []
      class_attribute :filters, default: []

      private attr_reader :records, :model, :pagination_metadata, :q

      def self.column(title, cell = title)
        raw_title = title
        raw_cell = cell

        title = raw_title.is_a?(Symbol) ? -> { raw_title.to_s.humanize } : raw_title
        cell = raw_cell.is_a?(Symbol) ? ->(record) { record.public_send(raw_cell) } : raw_cell

        columns << { title:, cell: }
      end

      def self.filter(title, clause, placeholder = title)
        raw_title = title
        raw_placeholder = placeholder
        title = raw_title.is_a?(Symbol) ? -> { raw_title.to_s.humanize } : raw_title
        placeholder = if raw_placeholder == raw_title
                        title
                      else
                        raw_placeholder.is_a?(Symbol) ? -> { raw_placeholder.to_s.humanize } : raw_placeholder
                      end

        filters << {
          title:,
          clause:,
          placeholder:
        }
      end

      def initialize(records:, model:, pagination_metadata:, q:)
        @records = records
        @model = model
        @pagination_metadata = pagination_metadata
        @q = q
      end

      def view_template
        div(id: 'records-list', data: { controller: 'record-row' })  do
          filter_form

          ul(class: 'list bg-base-100 rounded-box shadow-md', id: dom_id(model, :list)) do
            li(class: 'list-row') do
              columns.each do |column|
                div(class: 'font-bold') { try_call(column[:title]) }
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
                  div { try_call_with(column[:cell], record) }
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

          render PUI::El::Paginator.new(model:, metadata: pagination_metadata)
        end
      end

      private

      def filter_form
        div(class: 'pb-4') do
          search_form_for(q, class: 'flex flex-row gap-4 items-end') do |form|

            filters.each do |filter|
              fieldset(class: 'fieldset') do
                legend(class: 'fieldset-legend') { try_call(filter[:title]) }
                raw(
                  safe(
                   form.search_field(filter[:clause], placeholder: try_call(filter[:placeholder]), class: 'input w-32')
                  )
                )
              end
            end

            fieldset(class: 'fieldset') do
              button(type: 'submit', class: 'btn') do
                icon_lens
              end
            end
          end
        end
      end

      def buttons_attributes = { class: 'scale-0 group-hover:scale-100' }

      def try_call(val) = val.respond_to?(:call) ? val.call : val
      def try_call_with(value, *args)  = value.respond_to?(:call) ? value.call(*args) : value
    end
  end
end
