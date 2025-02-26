# frozen_string_literal: true

module Scan
  module Component
    module Config
      class Index < PUI::UI::Page::Index
        def records_list = render Records.new(records:, model:, pagination_metadata:, q:)
        def layout = ::Component::Layout::Application
      end
    end
  end
end
