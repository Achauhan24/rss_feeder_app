# frozen_string_literal: true

module Api
  class AgencyCategoriesController < Api::ApplicationController
    def create
      perform AgencyCategory::CreateAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def index
      perform AgencyCategory::IndexAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def show
      perform AgencyCategory::ShowAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def destroy
      perform AgencyCategory::DestroyAction do
        return render json: @action.data
      end
      render_action_error @action
    end
  end
end
