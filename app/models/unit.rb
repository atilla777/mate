# frozen_string_literal: true

class Unit < ApplicationRecord
  include Pageable
  include Decoratable

  enum :kind, { organization: 0, department: 1 }

  validates :name, presence: true
end
