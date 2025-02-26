# frozen_string_literal: true

module Scan
  class ConfigHostsRange < ApplicationRecord
    belongs_to :config
  end
end
