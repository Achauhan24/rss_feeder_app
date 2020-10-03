# frozen_string_literal: true

module Api
  class FeedsController < Api::ApplicationController
    def create
      perform Feed::CreateAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def index
      perform Feed::IndexAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def show
      perform Feed::ShowAction do
        return render json: @action.data
      end
      render_action_error @action
    end
  end
end
