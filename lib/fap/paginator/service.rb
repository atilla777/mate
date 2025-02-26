# frozen_string_literal: true

module FAP
  module Paginator
    class Service
      DEFAULT_PER_PAGE = 10
      NEXT = 'next'
      PREVIOUS = 'previous'
      DIRECTIONS = [ NEXT, PREVIOUS ].freeze

      def initialize(scope, cursor: nil, direction: nil, limit: DEFAULT_PER_PAGE, skip_total: true)
        @scope = scope
        @cursor = cursor
        @direction = direction
        @limit = limit
        @skip_total = skip_total
      end

      def records
        @records ||= page.records
      end

      def metadata
        @metadata ||= Pagination::Metadata.new(paginator:, page:, skip_total:, cursor:, direction:, limit:)
      end

      private

      attr_reader :scope, :cursor, :direction, :limit, :skip_total, :paginator

      def paginator
        @paginator ||= if force_first_page?
          first_page
        else
          direction == NEXT ? next_page : previous_page
        end
      end

      def force_first_page? = cursor.nil? || DIRECTIONS.exclude?(direction)

      def page
        @page ||= paginator.page
      end

      def first_page = scope.cursor_paginate(limit:)
      def next_page = scope.cursor_paginate(after: cursor, limit:)
      def previous_page = scope.cursor_paginate(before: cursor, limit:)
    end
  end
end
