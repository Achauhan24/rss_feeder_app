# frozen_string_literal: true

module Api
  class Feed::BaseAction < Abstract::BaseAction
    def self.record_class
      ::Feed
    end

    def self.serializer
      Api::FeedSerializer
    end

    def scope
      @scope ||= current_user.agency_categories
                             .find_by(id: params[:agency_category_id])
    end

    def record
      @record ||= self.class.record_class.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      not_found_error(self.class.record_class, self.class.record_type, params[:id])
    end
  end
end
