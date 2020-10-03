# frozen_string_literal: true

module Api
  class AgencyCategory::ShowAction < AgencyCategory::BaseAction
    def perform
      @success = !record.nil?
    end
  end
end
