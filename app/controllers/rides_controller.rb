class RidesController < ApplicationController
    before_action :logged_in_user
    before_action :set_user
    
    def garage
        @rides = @user.rides
    end

    def index
    end
    
    def show
        @ride = Ride.find(params[:id])
    end
    
    def new
        @ride = Ride.new
    end

    def edit
        @ride = Ride.find(params[:id])
    end
    
    def create
        @ride = current_user.rides.build(ride_params)
        if @ride.save
            flash[:success] = "Ride Added!"
            redirect_to @ride
        else
            render 'new'
        end
    end

    def update
        @ride = Ride.find_by(id: params[:id])
        if @ride.update_attributes(editable_ride_params)
          flash[:success] = "Ride updated"
          redirect_to @ride
        else
          render 'edit'
        end
    end

    def destroy
        @ride = current_user.rides.find_by(id: params[:id])
        @ride.destroy
        flash[:success] = "Ride removed"
        redirect_to garage_url
    end
    
    private
    
        def set_user
            @user = current_user
        end
    
        def ride_params
            params.require(:ride).permit(:make, :model, :year, :name, :category, :unit_of_measurement, :picture, :is_private)
        end
        
        def editable_ride_params
            params.require(:ride).permit(:name, :picture, :is_private)
        end
end
