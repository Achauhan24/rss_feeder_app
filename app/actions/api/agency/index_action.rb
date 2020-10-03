# frozen_string_literal: true

module Api
  class Agency::IndexAction < Agency::BaseAction
    def perform
      @success = !records.nil?
    end

    def records
      @records ||= self.class.record_class.all
    end

    def data
      self.class.serializer.new(records)
    end
  end
end
