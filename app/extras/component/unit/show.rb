# frozen_string_literal: true

module Component
  module Unit
    class Show < PUI::UI::Page::Show
      def fields
        show_text_field(record, :name, required: true)
        show_text_field(record, :description)
      end
    end
  end
end
