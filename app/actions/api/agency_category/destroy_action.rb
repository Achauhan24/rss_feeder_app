# frozen_string_literal: true

module API
  module V1
    class Observation::DestroyAction < Observation::BaseAction
      def perform
        @success = record.destroy!
      end
    end
  end
end
