# frozen_string_literal: true

module Decorator
  class Unit < SimpleDelegator
    def cell = "#{name} #{description}"
  end
end
