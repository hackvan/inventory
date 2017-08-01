class ProductsController < ApplicationController
  def index
    @products = Product.all.limit(10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "El producto fue creado con éxito"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path, notice: "El producto ha sido actualizado con éxito"
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id]).destroy
    redirect_to products_path, notice: "El producto fue eliminado con éxito"
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :category_ids => [])
    end
end
