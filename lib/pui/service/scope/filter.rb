# frozen_string_literal: true

module PUI
  module Service
    module Scope
      class Filter
        def initialize(scope, params)
          @scope = scope
          @params = params
        end

        def records = q.result

        def q
          @q ||= scope.ransack(params)
        end

        private

        attr_reader :params, :scope
      end
    end
  end
end
