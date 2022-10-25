class PagesController < ApplicationController
  def home
    if (logged_in? && is_admin?)
      redirect_to '/admin'
    end
    @categories = Category.all
  end

end
