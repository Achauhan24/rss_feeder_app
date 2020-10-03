# frozen_string_literal: true

module Api
  class SessionsController < Api::ApplicationController
    skip_before_action :authenticate!, only: :create

    def create
      perform Session::CreateAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def destroy
      perform Session::DestroyAction do
        return render json: @action.data
      end
      render_action_error @action
    end
  end
end
