# frozen_string_literal: true

module Api
  class Feed::UpdateAction < Feed::BaseAction
    def perform
      # rubocop:disable Rails/SkipsModelValidations
      @success = record.increment!(:click_count)
      # rubocop:enable Rails/SkipsModelValidations
    end
  end
end
