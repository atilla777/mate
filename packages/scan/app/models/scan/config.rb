# frozen_string_literal: true

module Scan
  class Config < ApplicationRecord
    include PUI::Mixins::Model

    belongs_to :unit

    has_many :config_hosts_ranges, dependent: :destroy
    has_many :config_ports_ranges, dependent: :destroy
    has_many :tasks, dependent: :destroy

    attr_accessor :hosts_ranges, :ports_ranges

    validates :name, presence: true

    def self.ransackable_attributes(_auth_object = nil)
      %w[created_at description id name unit_id updated_at]
    end
  end
end
