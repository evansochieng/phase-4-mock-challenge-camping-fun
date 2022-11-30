class CampersController < ApplicationController
#rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_response
rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_response
    def index
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show
        camper = find_camper
        render json: camper, serializer: CampActivSerializer, status: :ok
    end

    def create
        new_camper = Camper.create!(camper_params)
        render json: new_camper, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    private
    #find camper
    def find_camper
        Camper.find(params[:id])
    end

    #handle not found error
    def handle_not_found_response
        render json: {"error": "Camper not found"}, status: :not_found
    end

    #Mock assignment with strong params
    def camper_params
        params.permit(:name, :age)
    end

    #handle invalid parameters response
    def handle_invalid_response
        render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
    end
end
