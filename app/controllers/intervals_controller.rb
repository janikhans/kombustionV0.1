class IntervalsController < ApplicationController
  
  def new
    @context = context
    @interval = @context.intervals.new
  end

  def create
    @context = context
    @interval = @context.intervals.new(interval_params)
    
    if @interval.save
      flash[:success] = "Interval Created!"
      redirect_to context_url(context)
    else
      render 'new'
    end
  end

  def edit
    @context = context
    @interval = @context.intervals.find(params[:id])
  end

  def update
    @context = context
    @interval = @context.intervals.find(params[:id])
    
    if @interval.update_attributes(interval_params)
      flash[:success] = "Interval Changed!"
      redirect_to context_url(context)
    else
      render 'edit'
    end
  end
  
  private
    def interval_params
      #params.require(:interval).permit(:description, :length, :recommended, :action, :group)
      params.require(:interval).permit!
    end
    
    def context
      if params[:vehicle_id]
        id = params[:vehicle_id]
        Vehicle.find(params[:vehicle_id])
      else
        id = params[:ride_id]
        Ride.find(params[:ride_id])
      end
    end
    
    def context_url(context)
      if Vehicle === context
        vehicle_path(context)
      else
        ride_path(context)
      end
    end
end
