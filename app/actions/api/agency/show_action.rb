# frozen_string_literal: true

module Api
  class Agency::ShowAction < Agency::BaseAction
    def perform
      @success = !record.nil?
    end
  end
end
