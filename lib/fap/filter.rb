# frozen_string_literal: true

module FAP
  class Filter
    def self.call(...) = new(...).call

    def initialize(scope, params)
      @scope = scope
      @params = params
    end

    def call = scope.ransack(params).result

    private

    attr_reader :params, :scope
  end
end
