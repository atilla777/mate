# frozen_string_literal: true

module Scan
  module Component
    module Config
      class Edit < PUI::UI::Page::Edit
        def fields(form)
          edit_text_field(form, :name, required: true)
          edit_text_field(form, :description)
          autocomplete_text_field(form, :unit_id, Unit, record.unit&.name)
        end
      end
    end
  end
end
