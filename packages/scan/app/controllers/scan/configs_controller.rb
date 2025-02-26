# frozen_string_literal: true

module Scan
  class ConfigsController < ApplicationController
    private

    def model = Config
    def menu_active_keys = %i[scan config]
    def permitted_attributes_keys = %i[name description unit_id]
    def decorator_class = Scan::Decorator::Config
  end
end
