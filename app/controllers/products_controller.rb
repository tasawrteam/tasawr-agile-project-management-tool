class ProductsController < ApplicationController

  before_filter :login_required
  layout 'fresh'

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    @product.user_id = current_user.id

    if @product.save
      flash[:success] = 'Successfully created!'
      redirect_to product_url(@product.id)
    else
      flash[:notice] = 'Failed to create new product!'
      render :action => :new
    end
  end

  def edit
    @product = Product.find(params[:id].to_i)
    if !@product.author?(current_user)
      flash[:notice] = 'You are not authorized!'
      redirect_to products_url
    end
  end

  def update
    @product = Product.find(params[:id].to_i)
    attributes = params[:product]
    attributes.delete(:user_id)

    if @product.author?(current_user) && @product.update_attributes(attributes)
      flash[:success] = 'Successfully updated!'
      redirect_to product_url(@product.id)
    else
      flash[:notice] = 'Failed to update!'
      render :action => :edit
    end
  end

  def destroy
    product = Product.find(params[:id].to_i)
    if product.author?(current_user) && product.destroy
      flash[:success] = 'Successfully removed!'
    else
      flash[:notice] = 'Failed to remove!'
    end

    redirect_to products_url
  end

  def show
    @product = Product.find(params[:id].to_i)

  end
end
