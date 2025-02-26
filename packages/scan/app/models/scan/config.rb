module Scan
  class Config < ApplicationRecord
    include PUI::Mixins::Model

    belongs_to :unit

    def self.ransackable_attributes(_auth_object = nil)
      %w[created_at description id name unit_id updated_at]
    end
  end
end
