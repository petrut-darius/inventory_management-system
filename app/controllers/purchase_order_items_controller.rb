class PurchaseOrderItemsController < ApplicationController
  def index
    @purchase_order_items = PurchaseOrderItem.all
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

  private

  def purchase_order_item_params
     params.require(:purchase_order_item).permit(:product_id, :quantity, :cost_price)
  end
end
