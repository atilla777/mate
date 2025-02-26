# frozen_string_literal: true

module PUI
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
          hidden_field_tag(:direction, params[:direction])
          hidden_field_tag(:cursor, params[:cursor])
          hidden_field_tag(:per_page, params[:per_page])

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
