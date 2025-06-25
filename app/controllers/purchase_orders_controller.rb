class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [ :edit, :update, :destroy ]
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

  def edit
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def update
    if @purchase_order.update(purchase_order_params)
      flash[:notice] = "The purchase_order info was updated"
      redirect_to @purchase_order
    else
      render "edit"
    end
  end

  def destroy
    if @purchase_order.destroy
      flash[:notice] = "Purchase order deleted successfully"
      redirect_to purchase_orders_path
    else
      flash[:alert] = "Some error"
      redirect_to @purchase_order
    end
  end

  private

  def set_purchase_order
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def purchase_order_params
     params.require(:purchase_order).permit(:supplier_id, :status)
  end
end
