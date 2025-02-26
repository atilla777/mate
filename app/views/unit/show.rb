# frozen_string_literal: true

module Views
  module Unit
    class Show < PUI::View::Show
      def fields
        show_text_field(record, :name, required: true)
        show_text_field(record, :description)
      end
    end
  end
end
