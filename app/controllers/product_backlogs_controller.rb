class ProductBacklogsController < ApplicationController

  before_filter :login_required
  before_filter :detect_product

  layout 'fresh'

  def index
    if @product
      @product_backlogs = ProductBacklog.find_all_by_product_id(@product.id)
    else
      @product_backlogs = ProductBacklog.all
    end
    remove_layout
  end

  def new
    @product_backlog = ProductBacklog.new
    @products = Product.all
    if @product
      @product_backlog.product_id = @product.id
    end
    remove_layout
  end

  def create
    @product_backlog = ProductBacklog.new(params[:product_backlog])
    @product_backlog.user_id = current_user.id
    @products = Product.all
    
    if @product_backlog.save
      flash[:success] = 'Successfully created!'
      redirect_to product_product_backlogs_url(@product)
    else
      flash[:notice] = 'Failed to create!'
      render :action => :new
    end
  end

  def edit
    @product_backlog = ProductBacklog.find(params[:id].to_i)
    @products = Product.all
    if !@product_backlog.author?(current_user)
      flash[:notice] = 'You are not allowed to edit this item.'
      redirect_to root_url
    end

    remove_layout
  end

  def update
    @product_backlog = ProductBacklog.find(params[:id].to_i)

    if @product_backlog.author?(current_user)
      attributes = params[:product_backlog]
      attributes.delete(:user_id)

      if @product_backlog.update_attributes(attributes)
        flash[:success] = 'Successfully updated product backlog!'
        redirect_to product_product_backlogs_url(@product_backlog.product_id)
      else
        @products = Product.all
        flash[:notice] = 'Failed to update product backlog!'
        render :action => :edit
      end
    else
      flash[:notice] = 'You are not authorized!'
      redirect_to root_url
    end
  end

  def destroy
    product_backlog = ProductBacklog.find(params[:id].to_i)
    if product_backlog.author?(current_user) && product_backlog.destroy
      flash[:success] = 'Product backlog removed!'
    else
      flash[:notice] = 'Failed to remove product backlog or you are not authorized!'
    end

    redirect_to product_product_backlogs_url(@product)
  end

  def show
    @product_backlog = ProductBacklog.find(params[:id].to_i)
    remove_layout
  end

  private
    def detect_product
      if params[:product_id].to_i > 0
        @product = Product.find(params[:product_id].to_i)
      end
    end

end
