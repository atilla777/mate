# frozen_string_literal: true

module PUI
  module View
    class Records < Base
      class_attribute :columns, default: []

      private attr_reader :records, :model

      def self.column(title, cell = title)
        columns << {
          title: title.is_a?(Symbol) ? -> { title.to_s.humanize } : title,
          cell: cell.is_a?(Symbol) ? ->(record) { record.public_send(cell) } : cell
        }
      end

      def initialize(records:, model:)
        @records = records
        @model = model
      end

      def view_template
        div(id: "records-list")  do
          ul(class: "list bg-base-100 rounded-box shadow-md", id: dom_id(model, :list)) do
            li(class: "list-row") do
              columns.each do |column|
                div(class: "font-bold") { column[:title].call }
              end

              div(class: "font-bold") { "Action " }
            end

            records.each do |record|
              li(class: "list-row hover:bg-base-300 group") do
                columns.each do |column|
                  div do
                    show_record_button(record) { column[:cell].call(record) }
                  end
                end

                div do
                  edit_record_button(record, **buttons_attributes)
                  delete_record_button(record, **buttons_attributes)
                end

              end
            end
          end
        end
      end

      private

      def buttons_attributes = { class: 'scale-0 group-hover:scale-100' }
    end
  end
end
