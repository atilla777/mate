# frozen_string_literal: true

module Scan
  class ConfigsController < ApplicationController
    def create
      @record = form_object.save
      render_create_or_update
    end

    def update
      form_object.save
      render_create_or_update
    end

    private

    def model = Config
    def menu_active_keys = %i[scan config]

    def permitted_attributes_keys
      [
        :name,
        :description,
        :unit_id,
        :hosts_ranges,
        :ports_ranges
      ]
    end

    def form_object = FormObject::Config.new(record, permitted_attributes)
  end
end
