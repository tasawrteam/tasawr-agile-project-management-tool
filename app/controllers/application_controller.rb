# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :fb_sig_friends, :password

  def notify_successfully_saved
    flash[:success] = "Successfully saved!"
  end

  def notify_failed_to_save
    flash[:notice] = 'Failed to save!'
  end

  def remove_layout
    render :layout => false if request.xhr?
  end
end
