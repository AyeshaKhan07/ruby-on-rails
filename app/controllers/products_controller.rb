class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @new_product = Product.new
  end

  def create
    @new_product = Product.new(product_validations)
    if(@new_product.save)
      redirect_to @new_product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product_to_update = Product.find(params[:id])
  end

  def update
    @product_to_update = Product.find(params[:id])
    if(@product_to_update.update(product_validations))
      redirect_to @product_to_update
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def product_validations
      params.expect(product: [ :name ])
    end
end
