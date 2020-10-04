# frozen_string_literal: true

module Api
  class ApplicationController < ApplicationController
    include Authentication::Decoder
    before_action :authenticate!

    private

    def user_not_authorized
      render json: { error: 'Not Authorized' }, status: :forbidden
    end
  end
end
