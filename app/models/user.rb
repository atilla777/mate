class User < ApplicationRecord
  include PUI::Mixins::Model

  enum :kind, { manager: 0, user: 1, contact: 2 }

  validates :name, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at description id id_value kind name updated_at]
  end
end
