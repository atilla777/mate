# frozen_string_literal: true

module Views
  module Unit
    class Index < PUI::View::Index
      def records_list = render Records.new(records:, model:, pagination_metadata:)
    end
  end
end
