class InventoryItemsController < ApplicationController
  before_action :set_inventory_item, only: [ :edit, :update, :destroy ]
  def new
    @locations = Location.all
    @products = Product.all
    @inventory_item = InventoryItem.new
  end

  def index
    @inventory_items = InventoryItem.all
    @inventory_item = InventoryItem.new
  end

  def create
    @inventory_item = InventoryItem.new(inventory_item_params)
    authorize @inventory_item
    if @inventory_item.save
      flash[:notice] = "Inventory Item created successfully"
      redirect_to @inventory_item
    else
      flash[:alert] = "Something is wrong"
      redirect_to new_inventory_item_path
    end
  end

  def show
    @inventory_item = InventoryItem.find(params[:id])
  end

  def edit
    @locations = Location.all
    @products = Product.all
    @inventory_item = InventoryItem.find(params[:id])
  end

  def update
    if @inventory_item.update(inventory_item_params)
      flash[:notice] = "The inventory item info was updated"
      redirect_to @inventory_item
    else
      flash[:alert] = "Some error"
      render "edit"
    end
  end

  def destroy
    @inventory_item.destroy
    redirect_to inventory_items_path
  end

  private

  def set_inventory_item
    @inventory_item = InventoryItem.find(params[:id])
  end

  def inventory_item_params
    params.require(:inventory_item).permit(:product_id, :location_id)
  end
end
