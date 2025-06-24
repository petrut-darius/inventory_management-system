class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
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

  private

  def supplier_params
     params.require(:supplier).permit(:name, :email, :phone, :address)
  end
end
