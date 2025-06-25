class SuppliersController < ApplicationController
  before_action :set_supplier, only: [ :edit, :update, :destroy ]
  def index
    @suppliers = Supplier.all
    @supplier = Supplier.new
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      flash[:notice] = "Location created successfully"
      redirect_to @supplier
    else
      flash[:alert] = "Something is wrong"
      redirect_to new_supplier_path
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    if @supplier.update(supplier_params)
      flash[:notice] = "The supplier info was updated"
      redirect_to @supplier
    else
      flash[:alert] = "Some error"
      render "edit"
    end
  end

  def destroy
    if @supplier.destroy
      flash[:notice] = "Supplier deleted successfully"
      redirect_to suppliers_path
    else
      flash[:alert] = "Cannot delete supplier, it has associated purchase orders"
      redirect_to @supplier
    end
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
     params.require(:supplier).permit(:name, :email, :phone, :address)
  end
end
