class SignupsController < ApplicationController
        #Handle invalid error
#rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_response
rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_response

    def create
        signup = Signup.create!(signup_params)
        # find the camper and activity associated with new signup
        camper = Camper.find(signup.camper_id)
        activity = Activity.find(signup.activity_id)

        #render activity instance
        render json: activity, status: :created

    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    #handle invalid parameters
    def handle_invalid_response
        render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
    end

    def handle_not_found_response(exeption)
        render json: {"error": "#{exeption.model} not found"}, status: :not_found
    end
end
