
# frozen_string_literal: true

module PUI
  module Mixins
    module Model
      extend ActiveSupport::Concern

      included do
        class << self
          delegate :human, to: :model_name, prefix: true

          def model_name_human_plural = model_name.human(count: :many)
          def human_attribute(attr) = human_attribute_name(attr)
          def decorate(decorator_class) = all.map { |record| decorator_class.new(record) }
        end

        scope :decorated, -> { all.decorate }
      end
    end
  end
end
