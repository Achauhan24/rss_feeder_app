# frozen_string_literal: true

module Api
  class AgencyCategory::BaseAction < Abstract::BaseAction
    def self.record_class
      ::AgencyCategory
    end

    def self.serializer
      Api::AgencyCategorySerializer
    end

    def permitted_params
      params.require(:agency_category).permit(:category_id, :agency_id, :url)
    end

    def record
      @record ||= self.class.record_class.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      not_found_error(self.class.record_class, self.class.record_type, params[:id])
    end
  end
end
