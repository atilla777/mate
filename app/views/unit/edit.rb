# frozen_string_literal: true

module Views
  module Unit
    class Edit < PUI::View::Edit
      def fields(form)
        text_field(form, :name, required: true)
        text_field(form, :description)
      end
    end
  end
end
