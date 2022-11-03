class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_user
  include ApplicationHelper
  def require_user
    unless logged_in?
      flash[:alert] = 'You must be logged in to perform this action'
      redirect_to login_path
    end
  end
  
  def require_admin
    unless admin?
      flash[:alert] = 'You are not authorized to perform this action'
      redirect_to products_path
    end
  end
end
