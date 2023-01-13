class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

    #GET all 
    def index
        tenants = Tenant.all
        render json: tenants, status: :ok, each_serializer: TenantsSerializer
    end

    #GET one
    def show
        tenant = find_tenant
        render json: tenant, status: :ok, serializer: TenantsSerializer
    end

    #POST 
    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created, serializer: TenantsSerializer
    end

    #PATCH
    def update
        tenant = find_tenant
        tenant.update(tenant_params)
        render json: tenant, status: :accepted, serializer: TenantsSerializer
    end

    #DELETE
    def destroy
        tenant = find_tenant
        tenant.destroy
        head :no_content
    end

    private

    def find_tenant
        Tenant.find(params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: { error: "Tenant not found" }, status: :not_found
    end

    def render_invalid_response (e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
