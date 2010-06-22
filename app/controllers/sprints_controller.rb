class SprintsController < ApplicationController

  before_filter :login_required
  before_filter :detect_product_and_sprint
  layout 'fresh'

  def index
    @sprints = Sprint.all
  end

  def new
    @sprint = Sprint.new
    @sprint.product_id = @product.id
    @products = Product.all
  end

  def create
    @sprint = Sprint.new(params[:sprint])
    @sprint.user_id = current_user.id

    if @sprint.save
      flash[:success] = 'Successfully created!'
      redirect_to product_sprints_url(@product)
    else
      flash[:notice] = 'Failed to save!'
      @products = Product.all
      render :action => :new
    end
  end

  def edit
    if @sprint.author?(current_user)
      @sprint = Sprint.find(params[:id].to_i)
      @products = Product.all
    else
      flash[:notice] = 'You are not authorized!'
    end
  end

  def update
    @sprint = Sprint.find(params[:id].to_i)
    attributes = params[:sprint]
    attributes.delete(:user_id)

    if @sprint.author?(current_user) && @sprint.update_attributes(attributes)
      flash[:success] = 'Successfully saved!'
      redirect_to product_sprints_url(@product)
    else
      flash[:notice] = 'Failed to save!'
      @products = Product.all
      render :action => :edit
    end
  end

  def show
    @sprint = Sprint.find(params[:id].to_i)
  end

  def destroy
    sprint = Sprint.find(params[:id].to_i)
    if sprint.author?(current_user) && sprint.destroy
      flash[:success] = 'Successfully removed!'
    else
      flash[:notice] = 'Failed to remove!'
    end

    redirect_to product_sprints_url(@product)
  end

  private
    def detect_product_and_sprint
      if params[:product_id].to_i > 0
        @product = Product.find(params[:product_id].to_i)
      end

      if params[:id].to_i > 0
        @sprint = Sprint.find(params[:id].to_i)
      end
    end
end
