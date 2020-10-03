# frozen_string_literal: true

module Api
  class UsersController < Api::ApplicationController
    def add_categories
      perform User::AddCategoryAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def delete_feed
      perform User::DeleteFeedAction do
        return render json: @action.data
      end
      render_action_error @action
    end
  end
end
