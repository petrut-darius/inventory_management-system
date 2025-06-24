class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    authorize @location
    if @location.save
      flash[:notice] = "Location created successfully"
      redirect_to @location
    else
      flash[:alert] = "Something is wrong"
      redirect_to new_location_path
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :address)
  end
end
