# frozen_string_literal: true

module PUI
  module UI
    module Page
      class ListRecords < Records
        def records_partial
          ul(class: 'list bg-base-100 rounded-box shadow-md', id: dom_id(model, :list)) do
            li(class: 'list-row') do
              columns.each do |column|
                div(class: 'font-bold') { try_call(column[:title]) }
              end

              div(class: 'font-bold') { render PUI::UI::Misc::Paginator.new(model:, metadata: pagination_metadata) }
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
        end
      end
    end
  end
end
