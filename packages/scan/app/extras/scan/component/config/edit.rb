# frozen_string_literal: true

module Scan
  module Component
    module Config
      class Edit < PUI::UI::Page::Edit
        def fields(form)
          edit_text_field(form, :name, required: true)
          edit_text_field(form, :description)
          edit_collection_select_field(form, :unit_id)
        end
      end
    end
  end
end
