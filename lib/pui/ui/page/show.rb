# frozen_string_literal: true

module PUI
  module UI
    module Page
      class Show < RecordModal
        def initialize(record:, params:)
          super(record:)

          @params = params
        end

        private

        attr_reader :params

      def buttons
        div(class: 'flex') do
          edit_record_button(record, params:) unless skip_edit?

          delete_record_button(record, attrs: { class: 'mr-5' }, params:)
        end
      end

        def content = fields
        def fields = raise NotImplementedError

        def modal_box_attributes
          {
            id: 'record-modal-box',
            class: 'modal-box modal-open w-11/12 max-w-5xl',
            data: { controller: 'record-modal', action: 'turbo:submit-end->record-modal#closeOnSubmit' }
          }
        end

        def skip_edit? = false
      end
    end
  end
end
