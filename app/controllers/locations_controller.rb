class LocationsController < ApplicationController
  before_action :set_location, only: [ :edit, :update, :destroy ]
  def index
    @locations = Location.all
    @location = Location.new
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

  def edit
    @location = Location.find(params[:id])
  end

  def update
    if @location.update(location_params)
      flash[:notice] = "The location info was updated"
      redirect_to @location
    else
      flash[:alert] = "Some error"
      render "edit"
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address)
  end
end
