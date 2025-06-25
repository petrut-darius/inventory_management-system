class ProductsController < ApplicationController
  before_action :set_product, only: [ :new, :update, :destroy ]
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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "The product info was updated"
      redirect_to @product
    else
      flash[:alert] = "Some error"
      render "edit"
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
     params.require(:product).permit(:name, :sku, :description, :reorder_level, :price, :quantity)
  end
end
