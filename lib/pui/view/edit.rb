# frozen_string_literal: true

module PUI
  module View
    class Edit < Base
      include Phlex::Rails::Helpers::FormFor

      private attr_reader :record, :model_name_human, :disabled

      def initialize(record:, editable: false)
        @record = record
        @model_name_human = record.class.model_name_human
        @disabled = !editable
      end

      def view_template
        div(id: "record-form") do
          dialog(class: "modal modal-open", id: "record-form-dialog") do
            div(**modal_box_attributes) do
              div(class: 'flex justify-between items-center mb-6') do
                h1(class: "text-primary text-2xl font-bold") { model_name_human }
                if disabled
                  div do
                    edit_record_button(record)
                    delete_record_button(record)
                  end
                end
              end

              errors

              button(**close_button_attributes) { plain "x" }

              form_for(record) do |form|
                fields(form)

                save_button unless disabled
              end
            end
          end
        end
      end

      private

      def fields(_) = raise NotImplementedError

      def errors
        return if record.errors.empty?

        div(role: "alert", class: "alert alert-warning") do
          icon_warning

          record.errors.each do |error|
            span { plain "#{error.attribute} #{error.message}" }
          end
        end
      end

      def modal_box_attributes
        {
          id: "record-form-box",
          class: "modal-box modal-open w-11/12 max-w-5xl",
          data: { controller: "record-form", action: "turbo:submit-end->record-form#closeOnSubmit" }
        }
      end

      def close_button_attributes
        {
          class: "btn btn-sm btn-circle btn-ghost absolute right-2 top-2",
          data: { action: "click->record-form#close" }
        }
      end
    end
  end
end
