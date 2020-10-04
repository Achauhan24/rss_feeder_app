# frozen_string_literal: true

module Api
  class Feed::ListAllAction < Feed::BaseAction
    include Actions::Pagination
    def perform
      @success = !records.nil?
    end

    def scope
      @scope ||= ::Feed.joins(:agency_category)
                       .where(agency_categories: { category_id: params[:category_id] })
    end

    def records
      @records ||= scope.order(published_date: :desc)
    end

    def data
      self.class.serializer.new(records)
    end
  end
end
