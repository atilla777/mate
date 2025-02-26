module Pagination
  class Metadata
    attr_reader :limit, :total, :total_pages, :cursor, :direction

    def initialize(paginator:, page:, limit:, skip_total:, cursor:, direction:, filter_params:)
      @paginator = paginator
      @page = page
      @limit = limit
      @skip_total = skip_total
      @cursor = cursor
      @direction = direction
      @filter_params = filter_params
    end

    def total
      return @total if defined?(@total)

      @total = skip_total ? nil : paginator.total_count
    end

    def total_pages
      return @total_pages if defined?(@total_pages)

     @total_pages = skip_total ? nil : (count / limit.to_f).ceil
    end

    def next_cursor
      return unless has_next?

      page.next_cursor
    end

    def previous_cursor
      return unless has_previous?

      page.previous_cursor
    end

    def params = { direction:, cursor:, per_page: limit, q: filter_params }

    private

    attr_reader :paginator, :page, :skip_total, :limit, :filter_params

    with_options to: :page, private: true do
      delegate :has_previous?
      delegate :has_next?
    end
  end
end
