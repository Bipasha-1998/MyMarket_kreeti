class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  skip_before_action :require_user, except: %i[edit update index]
  before_action :require_same_user, only: %i[edit update destroy]
  before_action :require_admin, only: %i[admin destroy]

  def index
    @users = User.all
  end

  def show
    @products = @user.products
    @conversation = Conversation.new
    @conversations = Conversation.all
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      WelcomeMailer.with(user: @user).welcome_email.deliver_now 
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to My Market #{@user.username}, you signed up successfully"
      redirect_to products_path
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Account is successfully updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = 'Account and all the associated ads are succesfully deleted'
    redirect_to products_path
  end

  def admin; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user
      flash.now[:alert] = 'You are not authoruized to do this actions. You can only edit or update your own account'
      redirect_to root_path
    end
  end
end
