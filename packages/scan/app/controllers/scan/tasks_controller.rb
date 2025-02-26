# frozen_string_literal: true

module Scan
  class TasksController < ApplicationController
    def create
      ScanJob.perform_later(params[:config_id])
    end

    private

    def model = Task
    def menu_active_keys = %i[scan task]
  end
end
