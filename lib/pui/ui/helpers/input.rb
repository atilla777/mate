# frozen_string_literal: true

module PUI
  module UI
    module Helpers
      module Input
        include Phlex::Rails::Helpers::TextFieldTag
        include Phlex::Rails::Helpers::TextField

        private

        def show_text_field(record, field, text = nil, **options)
          fieldset(class: 'fieldset') do
            legend(class: 'fieldset-legend') do
              plain '*' if options[:required]
              plain text || record.class.human_attribute_name(field)
            end

            text_field_tag(field, record.send(field), class: 'input', readonly: true)
          end
        end

        def edit_text_field(form, field, text = nil, **options)
          fieldset(class: 'fieldset') do
            legend(class: [ 'fieldset-legend', ('text-error' if form.object.errors.include?(field)) ]) do
              plain '*' if options[:required]
              plain text || form.object.class.human_attribute_name(field)
            end

            form.text_field(field, class: 'input')
          end
        end

        def edit_collection_select_field(form, field, text = nil, **options)
          fieldset(class: 'fieldset') do
            legend(class: [ 'fieldset-legend', ('text-error' if form.object.errors.include?(field)) ]) do
              plain '*' if options[:required]
              plain text || form.object.class.human_attribute_name(field)
            end

            form.collection_select(field, Unit.all, :id, :name, {}, class: 'select')
          end
        end
      end
    end
  end
end
