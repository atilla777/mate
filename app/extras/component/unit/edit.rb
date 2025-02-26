# frozen_string_literal: true

module Component
  module Unit
    class Edit < PUI::UI::Page::Edit
      def fields(form)
        edit_text_field(form, :name, required: true)
        edit_text_field(form, :description)
      end
    end
  end
end
