# frozen_string_literal: true

module Api
  class AgenciesController < Api::ApplicationController
    def create
      perform Agency::CreateAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def index
      perform Agency::IndexAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def show
      perform Agency::ShowAction do
        return render json: @action.data
      end
      render_action_error @action
    end
  end
end
