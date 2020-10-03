# frozen_string_literal: true

module Api
  class AgencyCategory::CreateAction < AgencyCategory::BaseAction
    def record
      @record ||= current_user.agency_categories.build(permitted_params)
    end
  end
end
