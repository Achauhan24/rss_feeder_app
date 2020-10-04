# frozen_string_literal: true

module Api
  class UsersController < Api::ApplicationController
    skip_before_action :authenticate!, only: :create
    
    def create
      perform User::CreateAction do
        return render json: @action.data
      end
      render_action_error @action
    end
  end
end
