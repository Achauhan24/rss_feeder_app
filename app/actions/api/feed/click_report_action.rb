# frozen_string_literal: true

module Api
  class Feed::ClickReportAction < Feed::BaseAction
    def perform
      @success = !records.nil?
    end

    def records
      @records ||= current_user.feeds
                               .joins(agency_category: :agency)
                               .where('DATE(published_date) = ? ', params[:date])
                               .order(click_count: :desc)
    end

    def data
      self.class.serializer.new(records)
    end
  end
end
