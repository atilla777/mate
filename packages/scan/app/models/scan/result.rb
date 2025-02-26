# frozen_string_literal: true

module Scan
  class Result < ApplicationRecord
    include PUI::Mixins::Model

    belongs_to :task

    class << self
      def ransackable_attributes(_auth_object = nil)
        %w[id host port protocol state service]
      end

      def ransackable_associations(auth_object = nil)
        %w[task]
      end
    end
  end
end
