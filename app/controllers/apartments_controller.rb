class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response


    #GET all 
    def index
        apartments = Apartment.all
        render json: apartments, status: :ok
    end

    #GET one
    def show
        apartment = find_apartment
        render json: apartment, status: :ok
    end

    #POST 
    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    #PATCH
    def update
        apartment = find_apartment
        apartment.update(apartment_params)
        render json: apartment, status: :accepted
    end

    #DELETE
    def destroy
        apartment = find_apartment
        apartment.destroy
        head :no_content
    end

    private

    def find_apartment
        Apartment.find(params[:id])
    end

    def apartment_params
        params.permit(:number)
    end

    def render_not_found_response
        render json: { error: "Apartment not found" }, status: :not_found
    end

    def render_invalid_response (e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

end
