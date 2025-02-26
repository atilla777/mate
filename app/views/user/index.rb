# frozen_string_literal: true

module Views
  module User
    class Index < PUI::UI::View::Index
      def records_list = render Records.new(records:, model:, pagination_metadata:, q:)
      def layout = Views::Layouts::Application
    end
  end
end
