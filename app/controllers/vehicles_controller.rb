class VehiclesController < ApplicationController
    
    before_action :logged_in_user
    
    
    def create
        @vehicle = current_user.vehicles.build(vehicle_params)
        if @vehicle.save
            flash[:success] = "Vehicle Added!"
            redirect_to @vehicle
        else
            render 'new'
        end
    end

    def new
        @vehicle = Vehicle.new
    end

    def edit
        @vehicle = Vehicle.find(params[:id])
    end
    
    def show
        @vehicle = Vehicle.find(params[:id])
    end

    def update
        @vehicle = Vehicle.find_by(id: params[:id])
        if @vehicle.update_attributes(editable_vehicle_params)
          flash[:success] = "Vehicle updated"
          redirect_to @vehicle
        else
          render 'edit'
        end
    end

    def destroy
        @vehicle = current_user.vehicles.find_by(id: params[:id])
        @vehicle.destroy
        flash[:success] = "Vehicle removed"
        redirect_to garage_url
    end
    
    private
    
        def vehicle_params
            params.require(:vehicle).permit(:make, :model, :year, :name, :category, :unit_of_measurement, :picture)
        end
        
        def editable_vehicle_params
            params.require(:vehicle).permit(:name, :picture)
        end
end
