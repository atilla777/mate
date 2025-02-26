# frozen_string_literal: true

module PUI
  module UI
    module View
      class Edit < RecordModal
        include Phlex::Rails::Helpers::FormWith
        include Phlex::Rails::Helpers::HiddenFieldTag

        def initialize(record:, params:)
          super(record:)

          @params = params
        end

        private

        attr_reader :params

        def content
          errors

          form_with(model: record) do |form|
            fields(form)

            %i[direction cursor per_page].each do |key|
              hidden_field_tag(key, params[key]) if params[key].present?
            end

            if params['q'].present?
              params.fetch('q', {}).each do |field, value|
                hidden_field_tag("q[#{field}]", value)
              end
            end

            if params['sort'].present?
              params.fetch('sort', {}).each do |field, value|
                hidden_field_tag("sort[#{field}]", value)
              end
            end

            save_button
          end
        end

        def fields(_) = raise NotImplementedError

        def errors
          return if record.errors.empty?

          div(role: 'alert', class: 'alert alert-warning') do
            icon_warning

            record.errors.each do |error|
              span { plain "#{error.attribute} #{error.message}" }
            end
          end
        end

        def modal_box_attributes
          {
            id: 'record-form-box',
            class: 'modal-box modal-open w-11/12 max-w-5xl',
            data: { controller: 'record-modal', action: 'turbo:submit-end->record-modal#closeOnSubmit' }
          }
        end
      end
    end
  end
end
