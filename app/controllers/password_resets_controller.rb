class PasswordResetsController < ApplicationController
  skip_before_action :require_user

  def new; end

  def edit
    # finds user with a valid token
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to login_path, alert: 'Your token has expired. Please try again'
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
      redirect_to admin_approved_products_path, notice: 'Please check your mail to reset your password'
    else
      redirect_to login_path, alert: 'User does not exist. Please login'
    end
  end

  def update
    # updates user's password
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    if @user.update(password_params)
      redirect_to login_path, notice: 'Your password was reset successfully. Please sign in'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
