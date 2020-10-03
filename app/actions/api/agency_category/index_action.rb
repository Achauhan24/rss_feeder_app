# frozen_string_literal: true

module Api
  class AgencyCategory::IndexAction < AgencyCategory::BaseAction
    def perform
      @success = !records.nil?
    end

    def records
      @records ||= scope.includes(:category, :agency)
    end

    def data
      self.class.serializer.new(records)
    end
  end
end
