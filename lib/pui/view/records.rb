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
              li(class: "list-row hover:bg-base-300") do
                columns.each do |column|
                  div { column[:cell].call(record) }
                end

                div do
                  edit_record_button(record)
                  delete_record_button(record)
                end
              end
            end
          end
        end
      end
    end
  end
end
