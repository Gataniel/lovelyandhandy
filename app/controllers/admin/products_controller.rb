class Admin::ProductsController < Admin::ApplicationController
  before_action :find_product, only: %i(edit update destroy)

  def index
    @q = Product.search(params[:q])
    @products = @q.result(distinct: true)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to action: :index, notice: 'Product successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to action: :index, notice: 'Product successfully updated'
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to action: :index, notice: 'Product successfully destroyed'
    else
      redirect_to action: :index, notice: 'Something whent wrong'
    end
  end

  private

  def product_params
    params.require(:product).permit!
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
