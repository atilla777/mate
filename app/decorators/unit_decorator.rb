# frozen_string_literal: true

class UnitDecorator < SimpleDelegator
  def cell = "#{name} #{description}"
end
