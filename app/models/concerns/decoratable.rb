module Decoratable
  extend ActiveSupport::Concern

  included do
    def self.decorate(decorator_class) = all.map { |record| decorator_class.new(record) }

    scope :decorated, -> { all.decorate }
  end
end
