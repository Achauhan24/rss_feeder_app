# frozen_string_literal: true

module Api
  class FeedsController < Api::ApplicationController
    skip_before_action :authenticate!, only: :list_all

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

    def update
      perform Feed::UpdateAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def list_all
      perform Feed::ListAllAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def click_report
      perform Feed::ClickReportAction do
        return render json: @action.data
      end
      render_action_error @action
    end

    def generate_click_report
      perform Feed::GenerateClickReportAction do
        return render json: @action.data
      end
      render_action_error @action
    end
  end
end
