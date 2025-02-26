# frozen_string_literal: true

module Scan
  class Task < ApplicationRecord
    include PUI::Mixins::Model

    belongs_to :config

    enum :status, { started: 0, stopped: 1, finished: 2,  failed: 3 }

    validates :job_id, presence: true
    validates :process_id, presence: true

    has_many :results, dependent: :destroy

    def self.ransackable_attributes(_auth_object = nil)
      %w[id job_id process_id status]
    end
  end
end
