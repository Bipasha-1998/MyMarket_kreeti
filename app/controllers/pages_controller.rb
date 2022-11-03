class PagesController < ApplicationController
  skip_before_action :require_user

  def home
    redirect_to '/admin' if logged_in? && admin?
    @categories = Category.all
  end
end
