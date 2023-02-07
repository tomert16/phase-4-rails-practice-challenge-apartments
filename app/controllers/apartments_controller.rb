class ApartmentsController < ApplicationController
    wrap_parameters format: []
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index 
        render json: Apartment.all
    end

    def create 
        new_apartment = Apartment.create!(apartment_params)
        render json: new_apartment, status: :created
    end

    def update
        apartment = Apartment.find(params[:id])
        apartment_update = apartment.update!(apartment_params)
        render json: apartment, status: :accepted
    end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.destroy
            head :no_content
        else
            render json: { error: "Apartment not found" }, status: :not_found
        end
    end

    private

    # def render_unprocessable_entity(invalid)
    #     render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    # end

    def apartment_params
        params.permit(:number)
    end

end
