# frozen_string_literal: true

module PUI
  module El
    class TextField < Base
      private attr_reader :attrs, :form, :field, :label, :record

      def initialize(attrs: {}, form:, field:, record:)
        @attrs = mix(attrs, { class: "input" })
        @form = form
        @field = field
        @label = record.class.human_attribute_name(field)
        @record = record
      end

      def view_template
        fieldset(class: "fieldset") do
          legend(class: "fieldset-legend") { plain label }
          form.text_field(field, **attrs)
        end
      end
    end
  end
end
