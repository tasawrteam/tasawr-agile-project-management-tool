class SprintBacklogItemsController < ApplicationController

  before_filter :login_required
  before_filter :detect_product_and_sprint
  layout 'fresh'

  def index
    @sprint_backlog_items = SprintBacklogItem.all
    @sprint_backlog_item = SprintBacklogItem.new
    @product_backlogs = @product.product_backlogs 
  end

  private
    def detect_product_and_sprint
      if params[:sprint_id].to_i > 0
        @sprint = Sprint.find(params[:sprint_id].to_i)
      end

      if params[:product_id].to_i > 0
        @product = Product.find(params[:product_id].to_i)
      end

      if params[:product_backlog_id].to_i > 0
        @product_backlog = ProductBacklog.find(params[:product_backlog_id].to_i)
      end
    end
end
