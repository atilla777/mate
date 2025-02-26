# frozen_string_literal: true

module PUI
  module Service
    module Scope
      class Paginator
        DEFAULT_PER_PAGE = 10
        NEXT = 'next'
        PREVIOUS = 'previous'
        DIRECTIONS = [ NEXT, PREVIOUS ].freeze

        def initialize(
          scope,
          cursor: nil,
          direction: nil,
          limit: DEFAULT_PER_PAGE,
          skip_total: true,
          filter_params:,
          force_first_page:,
          sort_params:
        )
          @scope = scope
          @cursor = cursor
          @direction = direction
          @limit = limit
          @skip_total = skip_total
          @filter_params = filter_params
          @force_first_page = force_first_page
          @sort_params = sort_params
          @sort_field = sort_params&.fetch(:column, nil) || :id
          @sort_order = sort_params&.fetch(:asc, nil) ? :asc : :desc
        end

        def records
          @records ||= page.records
        end

        def metadata
          @metadata ||= Metadata.new(
            paginator:, page:, skip_total:, cursor:, direction:, limit:, filter_params:, sort_params:
          )
        end

        private

        attr_reader :scope, :cursor, :direction, :limit, :skip_total, :paginator,
                    :filter_params, :force_first_page, :sort_params, :sort_field, :sort_order

        delegate :has_next?, to: :page, private: true

        def paginator
          @paginator ||= if force_first_page?
            first_page
          else
            direction == NEXT ? next_page : previous_page
          end
        end

        def force_first_page? = force_first_page || cursor.nil? || DIRECTIONS.exclude?(direction)

        def page
          @page ||= paginator.page
        end

        def first_page = scope.cursor_paginate(**paginate_options)
        def next_page = scope.cursor_paginate(**paginate_options, after: cursor)
        def previous_page = scope.cursor_paginate(**paginate_options, before: cursor)

        def paginate_options
          { limit: }.tap do |options|
            options[:order] = { sort_field => sort_order } if sort_field
          end
        end
      end
    end
  end
end
