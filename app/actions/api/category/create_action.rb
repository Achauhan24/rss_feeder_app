# frozen_string_literal: true

module Api
  class Category::CreateAction < Category::BaseAction
    def record
      @record ||= self.class.record_class.new(permitted_params)
    end
  end
end
