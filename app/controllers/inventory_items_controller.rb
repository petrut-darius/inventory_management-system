class InventoryItemsController < ApplicationController
  def new
    @locations = Location.all
    @products = Product.all
    @inventory_item = InventoryItem.new
  end

  def index
    @inventory_items = InventoryItem.all
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

  private

  def inventory_item_params
    params.require(:inventory_item).permit(:product_id, :location_id)
  end
end
