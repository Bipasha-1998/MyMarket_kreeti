class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy buy responded]
  before_action :require_same_user_or_admin, only: %i[edit update destroy responded]
  before_action :set_categories
  before_action :require_admin, only: %i[index toggle_is_approved]
  skip_before_action :require_user, only: %i[show admin_approved_products]

  def index
    # Only admin has the access to see all created ads in order to approve or reject the posted ad
    @products = Product.page(params[:page]).per(5)
  end

  def show
    @reviews = @product.reviews.all
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      flash[:notice] = 'Ad created successfully.Waiting for Admin approval'
      redirect_to admin_approved_products_path
    else
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Ad updated successfully'
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_approved_products_path
  end

  def toggle_is_approved
    @product = Product.find(params[:id])
    admin = current_user.username
    @product.update!(is_approved: true, approved_by: admin)
    redirect_to admin_approved_products_path, notice: 'The Product is successfully approved'
  end

  def admin_approved_products
    # Once admin has approved the posted ad, the product will be visible to regular user
    @products = Product.page(params[:page])
  end

  def buy
    # This action handles the situation after the user clicks 'Buy now' button
    @user = User.find(params[:user_id])
    ProductResponseMailer.with(user: @user).delay.response(@product)
    @product.responsed_user_ids.push(@user.id)
    if @product.save
      redirect_to product_path(@product), notice: 'You have successfully responded. Seller will contact you soon'
    else
      flash.now[:alert] = 'Something went wrong.Try again...'
    end
  end

  def responded
    # This action handles the situation where the seller can see the list of interested buyers
    @product.responsed_user_ids.each do |u|
      @user = User.find(u)
    end
  end

  def searched_products
    # This action handles the filter feature where results get rendered in different view named same as this action
    @products = Product.filter(params.slice(:title, :category, :city)).page(params[:page])
    if @products.count.zero?
      redirect_to admin_approved_products_path, alert: 'No results found matching your search'
    else
      flash.now[:notice] = "#{@products.count} results found matching your search"
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id, :city, :phone_number, :image, pictures: [])
  end

  def require_same_user_or_admin
    if current_user != @product.user && !admin?
      flash[:alert] = 'You can only edit or delete your own posted ads'
      redirect_to @product
    end
  end

  def set_categories
    @categories = Category.all.order(:name)
  end
end
