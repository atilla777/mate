# frozen_string_literal: true

class UnitsController < ApplicationController
  def autocomplete
    records = Unit.where('name LIKE ?', "#{ActiveRecord::Base.send(:sanitize_sql_like, params[:value])}%")
    render(
      turbo_stream: turbo_stream.update(
        params[:target_id],
        PUI::UI::Misc::Autocomplete.new(records:, keyword: params[:value])
      )
    )
  end

  private

  def model = Unit
  def menu_active_keys = %i[core unit]
  def permitted_attributes_keys = %i[name kind description]
end
