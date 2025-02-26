# frozen_string_literal: true

module PUI
  module Helpers
    module Input
      include Phlex::Rails::Helpers::TextField

      private

      def text_field(form, field, text = nil, **options)
        fieldset(class: "fieldset") do
          legend(class: ['fieldset-legend', ('text-error' if form.object.errors.include?(field))]) do
            plain '*' if options[:required]
            plain text || form.object.class.human_attribute_name(field)
          end

          form.text_field(field, class: 'input', readonly: disabled)
        end
      end
    end
  end
end
