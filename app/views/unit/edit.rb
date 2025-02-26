# frozen_string_literal: true

module Views
  module Unit
    class Edit < PUI::View::Edit
      def fields(form)
        render PUI::El::TextField.new(form:, field: :name, record:)
        render PUI::El::TextField.new(form:, field: :description, record:)
      end
    end
  end
end
