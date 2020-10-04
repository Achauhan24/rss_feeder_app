# frozen_string_literal: true

module Api
  class User::BaseAction < Abstract::BaseAction
    def self.record_class
      ::User
    end

    def self.serializer
      Api::UserSerializer
    end

    def permitted_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def record
      @record ||= self.class.record_class.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      not_found_error(self.class.record_class, self.class.record_type, params[:id])
    end
  end
end
