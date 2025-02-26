# frozen_string_literal: true

class UsersController < ApplicationController
  private

  def model = User
  def menu_active_keys = %i[core user]
  def permitted_attributes_keys = %i[name kind description]
end
