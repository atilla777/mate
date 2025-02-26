# frozen_string_literal: true

module Component
  module User
    class Index < PUI::UI::Page::Index
      def records_list = render Records.new(records:, model:, pagination_metadata:, q:)
      def layout = Layout::Application
    end
  end
end
