class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    if @product.save
      flash[:notice] = "Location created successfully"
      redirect_to @product
    else
      flash[:alert] = "Something is wrong"
      redirect_to new_location_path
    end
  end

  private

  def product_params
     params.require(:product).permit(:name, :sku, :description, :reorder_level, :price, :quantity)
  end
end
