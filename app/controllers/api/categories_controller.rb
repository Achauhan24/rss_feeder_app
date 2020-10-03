# frozen_string_literal: true

module Api
  class CategoriesController < Api::ApplicationController
    def create
      perform Category::CreateAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def index
      perform Category::IndexAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def show
      perform Category::ShowAction do
        return render json: @action.data
      end
      render_action_error @action
    end
  end
end
