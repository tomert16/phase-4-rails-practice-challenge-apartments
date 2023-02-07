class TenantsController < ApplicationController
    wrap_parameters format: []

    def index 
        render json: Tenant.all
    end

    def create
        new_tenant = Tenant.create!(tenant_params)
        render json: new_tenant, status: :created
    end

    def update
        tenant = Tenant.find(params[:id])
        tenant_updates = tenant.update!(tenant_params)
        render json: tenant, status: :accepted
    end

    def destroy 
        tenant = Tenant.find_by(id: params[:id])
        if tenant 
            tenant.destroy
            head :no_content
        else
            render json: { error: "Tenant not found" }, status: :not_found
        end
    end

    private 

    def tenant_params
        params.permit(:name, :age)
    end

end
