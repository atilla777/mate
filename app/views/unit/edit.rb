# frozen_string_literal: true

module Views
  module Unit
    class Edit < PUI::UI::View::Edit
      def fields(form)
        edit_text_field(form, :name, required: true)
        edit_text_field(form, :description)
      end
    end
  end
end
