# frozen_string_literal: true

module Api
  class AgencyCategory::DestroyAction < AgencyCategory::BaseAction
    def perform
      @success = record.destroy!
    end
  end
end
