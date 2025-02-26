# frozen_string_literal: true

class UsersController < ApplicationController
  def index = render PUI::View::Index.new(model:, records: [])

  private

  def model = Unit
end
