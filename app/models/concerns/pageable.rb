# frozen_string_literal: true

module Pageable
  extend ActiveSupport::Concern

  included do
    class << self
      delegate :human, to: :model_name, prefix: true
    end
  end
end
