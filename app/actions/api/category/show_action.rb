# frozen_string_literal: true

module Api
  class Category::ShowAction < Category::BaseAction
    def perform
      @success = !record.nil?
    end
  end
end
