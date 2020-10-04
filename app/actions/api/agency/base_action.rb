# frozen_string_literal: true

module Api
  class Agency::BaseAction < Abstract::BaseAction
    def self.record_class
      ::Agency
    end

    def self.serializer
      Api::AgencySerializer
    end

    def permitted_params
      params.require(:agency).permit(:name, :logo_path)
    end

    def record
      @record ||= self.class.record_class.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      not_found_error(self.class.record_class, self.class.record_type, params[:id])
    end
  end
end
