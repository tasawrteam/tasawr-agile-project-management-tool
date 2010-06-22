class BacklogItemsController < ApplicationController

  before_filter :login_required
  before_filter :detect_product_product_backlog

  layout 'fresh'

  def index
    @backlog_items = @product_backlog.backlog_items
    remove_layout
  end

  def new
    @backlog_item = BacklogItem.new(:product_backlog_id => @product_backlog.id)
    remove_layout
  end

  def create
    @backlog_item = BacklogItem.new(params[:backlog_item])
    @backlog_item.product_backlog_id = @product_backlog.id
    @backlog_item.user_id = current_user.id
    @backlog_item.product_id = @product_backlog.product_id

    if @backlog_item.save
      flash[:success] = 'Successfully added item!'
      redirect_to product_product_backlog_backlog_items_url(@product, @product_backlog)
    else
      flash[:notice] = 'Failed to add new item'
      render :action => :new
    end
  end

  def edit
    @backlog_item = BacklogItem.find(params[:id].to_i)
    remove_layout
  end

  def update
    @backlog_item = BacklogItem.find(params[:id].to_i)
    attributes = params[:backlog_item]
    attributes.delete(:user_id)
    attributes[:product_id] = @product_backlog.product_id

    if @backlog_item.update_attributes(attributes)
      flash[:success] = 'Successfully updated!'
      redirect_to product_product_backlog_backlog_items_url(@product, @product_backlog)
    else
      flash[:notice] = 'Failed to update!'
      render :action => :edit
    end
  end

  def show
    @backlog_item = BacklogItem.find(params[:id].to_i)
    remove_layout
  end

  def destroy
    backlog_item = BacklogItem.find(params[:id].to_i)
    if backlog_item.destroy
      flash[:success] = 'Successfully removed!'
    else
      flash[:notice] = 'Failed to remove'
    end

    redirect_to product_product_backlog_backlog_items_url(@product, @product_backlog)
  end

  private
    def detect_product_product_backlog
      if params[:product_id].to_i > 0
        @product = Product.find(params[:product_id].to_i)
      end 
      @product_backlog = ProductBacklog.find(params[:product_backlog_id].to_i)
    end
end
