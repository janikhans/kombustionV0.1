class VehiclesController < ApplicationController
    
    before_action :logged_in_user
  
    def index
        @vehicles = Vehicle.all
    end
    
    def show
        @vehicle = Vehicle.find(params[:id])
    end
    
    def new
        @vehicle = Vehicle.new
    end
    
    def edit
        @vehicle = Vehicle.find(params[:id])
    end
 
    def create
        @vehicle = Vehicle.new(vehicle_params)
        if @vehicle.save
            flash[:success] = "Vehicle Added!"
            redirect_to @vehicle
        else
            render 'new'
        end
    end
    
    def update
        @vehicle = Vehicle.find(params[:id])
        if @vehicle.update_attributes(vehicle_params)
              flash[:success] = "Vehicle Updated"
              redirect_to @vehicle
        else
          render 'edit'
        end
    end
    
    def destroy
        @vehicle = Vehicle.find(params[:id])
        @vehicle.destroy
        flash[:success] = "Vehicle removed"
        redirect_to vehicles_path
    end
    
    private
    
        def vehicle_params
            params.require(:vehicle).permit(:make, :model, :year, :category)
        end
end