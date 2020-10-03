# frozen_string_literal: true

module Api
  class Agency::CreateAction < Agency::BaseAction
    def record
      @record ||= self.class.record_class.new(permitted_params)
    end
  end
end
