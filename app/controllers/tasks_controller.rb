class TasksController < ApplicationController

  before_filter :login_required
  before_filter :detect_product_product_backlog_and_backlog_item

  layout 'fresh'

  def index
    @tasks = @backlog_item.tasks
    remove_layout
  end

  def new
    @task = Task.new
    remove_layout
  end

  def create
    @task = Task.new(params[:task])
    @task.user_id = current_user.id
    @task.backlog_item_id = @backlog_item.id
    @task.product_id = @product.id

    if @task.save
      flash[:success] = 'Successfully added!'
      redirect_to product_product_backlog_backlog_item_tasks_url(
        :product_id => @product.id,
        :product_backlog_id => @product_backlog.id,
        :backlog_item_id => @backlog_item.id
        )
    else
      flash[:notice] = 'Failed to add new task!'
      render :action => :new
    end
  end

  def edit
    @task = Task.find(params[:id].to_i)
    if @task.author?(current_user)
      @task = Task.find(params[:id].to_i)
    end
    remove_layout
  end

  def update
    @task = Task.find(params[:id].to_i)
    attributes = params[:task]
    attributes.delete(:user_id)
    attributes[:product_id] = @product.id

    if @task.author?(current_user) && @task.update_attributes(attributes)
      flash[:success] = 'Successfully updated!'
      redirect_to product_product_backlog_backlog_item_tasks_url(
        :product_id => @product.id,
        :product_backlog_id => @product_backlog.id,
        :backlog_item_id => @backlog_item.id
        )
    else
      flash[:notice] = 'Failed to update your task!'
      render :action => :edit
    end
  end

  def destroy
    task = Task.find(params[:id].to_i)
    if task.author?(current_user) && task.destroy
      flash[:success] = 'Successfully removed your task!'
    else
      flash[:notice] = 'Failed to remove your task!'
    end

    redirect_to product_product_backlog_backlog_item_tasks_url(
        :product_id => @product.id,
        :product_backlog_id => @product_backlog.id,
        :backlog_item_id => @backlog_item.id)
  end

  private
    def detect_product_product_backlog_and_backlog_item
      if params[:product_id].to_i > 0
        @product = Product.find(params[:product_id].to_i)
      end
      
      @product_backlog = ProductBacklog.find(params[:product_backlog_id].to_i)
      @backlog_item = BacklogItem.find(params[:backlog_item_id].to_i)
    end

end
