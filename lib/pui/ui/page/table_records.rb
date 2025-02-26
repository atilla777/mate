# frozen_string_literal: true

module PUI
  module UI
    module Page
      class TableRecords < Records
        def records_partial
          table(class: 'table', id: dom_id(model, :list)) do
            thead do
              tr(class: 'font-bold') do
                columns.each do |column|
                  th { try_call(column[:title]) }
                end

                th(class: 'w-32 text-right') do
                  render PUI::UI::Misc::Paginator.new(model:, metadata: pagination_metadata)
                end
              end
            end

            tbody do
              records.each do |record|
                tr(
                  class: 'hover:bg-base-300 group',
                  data: {
                    action: 'click->record-row#showRecord',
                    record_row_id_param: dom_id(record)
                  }
                ) do
                  columns.each do |column|
                    td { try_call_with(column[:cell], record) }
                  end

                  td(class: 'flex') do
                    show_record_button(
                      record, params: pagination_metadata.params, attrs: buttons_attributes.merge(id: dom_id(record))
                    )
                    edit_record_button(record, **buttons_attributes, params: pagination_metadata.params)
                    delete_record_button(record, params: pagination_metadata.params, attrs: buttons_attributes)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
