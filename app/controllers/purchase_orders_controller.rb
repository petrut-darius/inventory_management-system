class PurchaseOrdersController < ApplicationController
  def index
    @purchase_orders = PurchaseOrder.all
    @purchase_order = PurchaseOrder.new
  end

  def show
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def new
    @suppliers = Supplier.all
    @purchase_order = PurchaseOrder.new
  end



  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    authorize @purchase_order
    if @purchase_order.save
      flash[:notice] = "Purchase order created successfully"
      redirect_to @purchase_order
    else
      flash[:alert] = "Something is wrong"
      redirect_to new_purchase_order_path
    end
  end

  private

  def purchase_order_params
     params.require(:purchase_order).permit(:supplier_id, :status)
  end
end
