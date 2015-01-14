class RidesController < ApplicationController
    
    before_action :logged_in_user, only: [:garage, :new, :create, :edit, :update, :destroy]
    before_action :set_user
    before_action :correct_user, only: [:edit, :update]
    
    def garage
        @rides = @user.rides
    end

    def index
        @explores = Ride.where(is_private: false).paginate(page: params[:page], :per_page => 18)
        unless logged_in?
            render layout: "welcome"
        end
    end
    
    def show
        @ride = Ride.find(params[:id])
        @intervals = @ride.intervals
        unless logged_in?
            render layout: "welcome"
        end
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
    
        def correct_user
          @user = Ride.find(params[:id]).user
          redirect_to(root_url) unless current_user?(@user)
        end
        
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
