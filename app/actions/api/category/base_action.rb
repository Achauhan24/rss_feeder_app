# frozen_string_literal: true

module Api
  class Category::BaseAction < Abstract::BaseAction
    def self.record_class
      ::Category
    end

    def self.serializer
      Api::CategorySerializer
    end

    def permitted_params
      params.require(:category).permit(:title)
    end

    def record
      @record ||= self.class.record_class.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      not_found_error(self.class.record_class, self.class.record_type, params[:id])
    end
  end
end
