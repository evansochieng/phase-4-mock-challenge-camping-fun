class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_response
    def index
        activities = Activity.all
        render json: activities, status: :ok
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        render json: {}, status: :ok
    end

    private
    #handle not found response
    def handle_not_found_response
        render json: {"error": "Activity not found"}, status: :not_found
    end
end
