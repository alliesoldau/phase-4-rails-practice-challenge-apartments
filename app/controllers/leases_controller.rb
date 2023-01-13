class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

    #POST
    def create
        lease = Lease.create!(lease_params)
        render json: lease, status: :created, serializer: LeasesSerializer
    end

    #DELETE
    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content
    end

    private 

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

    def render_not_found_response
        render json: { error: "Tenant not found" }, status: :not_found
    end

    def render_invalid_response (e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
