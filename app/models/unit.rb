# frozen_string_literal: true

class Unit < ApplicationRecord
  include Pageable
  include Decoratable

  enum :kind, { organization: 0, department: 1 }

  validates :name, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at description id id_value kind name updated_at]
  end
end
