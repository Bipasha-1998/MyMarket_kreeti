class SessionsController < ApplicationController
  skip_before_action :require_user

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully'
      if logged_in? && admin?
        redirect_to '/admin' 
      else
        redirect_to products_path
      end
    else
      flash.now[:alert] = 'Invalid email or password. Try again'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out successfully'
    redirect_to root_path
  end

  def omniauth
    @user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.urlsafe_base64
    end
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to products_path, notice: 'Logged in successfully'
    else
      redirect_to '/login', alert: 'Something went wrong. Please try again'
    end
  end
  
  private
  
  def auth
    request.env['omniauth.auth']
  end
end
