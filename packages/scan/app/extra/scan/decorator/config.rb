# frozen_string_literal: true

module Scan
  module Decorator
    class Config < SimpleDelegator
      def cell = "#{name} #{description}"
    end
  end
end
