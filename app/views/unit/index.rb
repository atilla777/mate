# frozen_string_literal: true

module Views
  module Unit
    class Index < PUI::View::Index
      def records_list = render Records.new(records:, model:)
    end
  end
end
