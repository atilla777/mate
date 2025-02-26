# frozen_string_literal: true

module Scan
  module Component
    module Task
      class Index < PUI::UI::Page::Index
        private

        def records_list = render Records.new(records:, model:, pagination_metadata:, q:)
        def layout = ::Component::Layout::Application
        def skip_new? = true
      end
    end
  end
end
