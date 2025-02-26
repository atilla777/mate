# frozen_string_literal: true

module PUI
  module UI
    module Page
      class TableRecords < Records
        def records_partial
          table(class: 'table table-auto', id: dom_id(model, :list)) do
            thead do
              tr(class: 'font-bold') do
                columns.each do |column|
                  th(class: column[:class]) { try_call(column[:title]) }
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
                    td(class: column[:class]) { try_call_with(column[:cell], record) }
                  end

                  td(class: 'flex') { actions(record) }
                end
              end
            end
          end
        end
      end
    end
  end
end
