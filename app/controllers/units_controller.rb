# frozen_string_literal: true

class UnitsController < ApplicationController
  private

  def model = Unit
  def menu_active_keys = %i[core unit]
  def permitted_attributes_keys = %i[name kind description]
end
