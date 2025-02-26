# frozen_string_literal: true

module Decorator
  class User < SimpleDelegator
    def cell = "#{name} #{description}"
  end
end
