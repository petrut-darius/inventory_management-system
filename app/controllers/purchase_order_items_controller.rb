class PurchaseOrderItemsController < ApplicationController
  before_action :set_purchase_order_item, only: [ :edit, :update, :destroy ]
  def index
    @purchase_order_items = PurchaseOrderItem.all
    @product_order_item = PurchaseOrderItem.new
  end

  def show
    @purchase_order_item = PurchaseOrderItem.find(params[:id])
  end

  def new
    @products = Product.all
    @purchase_order_item = PurchaseOrderItem.new
  end



  def create
    @purchase_order_item = PurchaseOrderItem.new(purchase_order_item_params)
    authorize @purchase_order_item
    if @purchase_order_item.save
      flash[:notice] = "Purchase order item created successfully"
      redirect_to @purchase_order_item
    else
      flash[:alert] = "Something is wrong"
      redirect_to new_purchase_order_item_path
    end
  end

  def edit
    @purchase_order_item = PurchaseOrderItem.find(params[:id])
  end

  def update
    if @purchase_order_item.update(purchase_order_item_params)
      flash[:notice] = "The purchase_order_item info was updated"
      redirect_to @purchase_order_item
    else
      flash[:alert] = "Some error"
      render "edit"
    end
  end

  def destroy
    if @purchase_order_item.destroy
      flash[:notice] = "Purchase order item deleted successfully"
      redirect_to purchase_orders_item_path
    else
      flash[:alert] = "Cannot delete purchase order item, it has associated purchase orders"
      redirect_to @purchase_order_item_item
    end
  end

  private

  def set_purchase_order_item
    @purchase_order_item = PurchaseOrderItem.find(params[:id])
  end

  def purchase_order_item_params
     params.require(:purchase_order_item).permit(:product_id, :quantity, :cost_price)
  end
end
