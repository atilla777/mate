# frozen_string_literal: true

module PUI
  module UI
    module Helper
      module Inputs
        include Phlex::Rails::Helpers::TextFieldTag
        include Phlex::Rails::Helpers::TextField

        private

        def show_text_field(record, field, text = nil, **attrs)
          fieldset(class: 'fieldset') do
            legend(class: 'fieldset-legend') do
              plain '*' if attrs[:required]
              plain text || record.class.human_attribute_name(field)
            end

            text_field_tag(field, attrs[:value] || record.send(field), class: 'input', readonly: true)
          end
        end

        def edit_text_field(form, field, label = nil, **attrs)
          fieldset(class: 'fieldset') do
            legend(class: [ 'fieldset-legend', ('text-error' if form.object.errors.include?(field)) ]) do
              plain '*' if attrs[:required]
              plain label || form.object.class.human_attribute_name(field)
            end

            form.text_field(field, class: 'input')
          end
        end

        def autocomplete_text_field(form, field, model, displayed_text, label = nil, **attrs)
          fieldset(
            class: 'fieldset',
            data: {
              controller: 'autocomplete',
              autocomplete_url_value: path(model, action: :autocomplete)
            }
          ) do
            legend(class: ['fieldset-legend', ('text-error' if form.object.errors.include?(field))]) do
              plain '*' if attrs[:required]
              plain label || form.object.class.human_attribute_name(field)
            end

            form.hidden_field(field, data: { autocomplete_target: 'selectedValue' })

            input(
              type: 'text',
              class: 'input',
              autocomplete: 'off',
              data: {
                action: 'keyup->autocomplete#search',
                autocomplete_target: 'selectedLabel'
              },
              value: displayed_text
            )

            ul(
              class: 'bg-base-100 shadow-md rounded-box z-50 mt-1 w-max max-w-full',
              id: dom_id(model, 'autocomplete_variants'), data: { autocomplete_target: 'variants' }
            )
          end
        end
      end
    end
  end
end
