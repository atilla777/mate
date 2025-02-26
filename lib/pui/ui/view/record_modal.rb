# frozen_string_literal: true

module PUI
  module UI
    module View
      class RecordModal < Base
        private attr_reader :record, :model_name_human

        def initialize(record:)
          @record = record
          @model_name_human = record.class.model_name_human
        end

        def view_template
          div(id: 'record') do
            dialog(class: 'modal modal-open', id: 'record-modal-dialog') do
              div(**modal_box_attributes) do
                div(class: 'flex justify-between items-center mb-6') do
                  h1(class: 'text-primary text-2xl font-bold') { model_name_human }

                  buttons
                end

                button(**close_button_attributes) { plain 'x' }

                content
              end
            end
          end
        end

        private

        def buttons = nil

        def content = raise NotImplementedError
        def fields = raise NotImplementedError

        def modal_box_attributes
          {
            id: 'record-modal-box',
            class: 'modal-box modal-open w-11/12 max-w-5xl',
            data: { controller: 'record-modal' }
          }
        end

        def close_button_attributes
          {
            class: 'btn btn-sm btn-circle btn-ghost absolute right-2 top-2',
            data: { action: 'click->record-modal#close' }
          }
        end
      end
    end
  end
end
