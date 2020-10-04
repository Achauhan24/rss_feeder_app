# frozen_string_literal: true

module Api
  class Session::DestroyAction < Abstract::BaseAction
    def perform
      @success = blacklist_token!
    end

    def blacklist_token!
      current_user.blacklist_tokens.create!(token: params[:token])
    end

    def data
      {
        success: true,
        message: 'Logged Out'
      }
    end
  end
end
