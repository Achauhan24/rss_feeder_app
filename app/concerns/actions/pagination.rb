# frozen_string_literal: true

module Actions
  module Pagination
    def paginated_records
      @paginated_records ||= records.page(page).per(limit)
    end

    def options
      @options = {}
      @options[:meta] = paginate_metadata
      @options
    end

    def page
      params[:page] || 1
    end

    def limit
      params[:limit] || 10
    end

    def paginate_metadata
      {
        current_page: page,
        limit: limit,
        total_pages: total_pages,
        total_records: total_count
      }
    end

    delegate :total_pages, to: :paginated_records

    delegate :total_count, to: :paginated_records
  end
end
