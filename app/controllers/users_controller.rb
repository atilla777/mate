# frozen_string_literal: true

class UsersController < ApplicationController
  def index = render UI::Base::Index.new
end
