# frozen_string_literal: true

module Api
  class User::CreateAction < User::BaseAction
    def record
      @record ||= self.class.record_class.new(permitted_params)
    end
  end
end
