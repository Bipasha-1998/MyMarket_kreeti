class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy, :buy, :responded]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user_or_admin, only: [:edit, :update, :destroy]
    before_action :set_categories

    def show
        @reviews = @product.reviews.all

    end

    def index
        @products = Product.all

        @products = @products.filter_by_city(params[:city].downcase) if params[:city].present?
        @products = @products.filter_by_title(params[:title].downcase) if params[:title].present?
        @products = @products.filter_by_category(params[:category]) if params[:category].present?
    end

    def new
        @product = Product.new
    end

    def edit

    end

    def create
        @product = Product.new(product_params)
         @product.user = current_user
        if @product.save
            flash[:notice] = "Ad created successfilly"
            redirect_to @product
        else
            render 'new'
        end
    end

    def update
        if @product.update(product_params)
            flash[:notice] = "Ad updated successfully"
            redirect_to @product
        else
            render 'edit'
        end
    end

    def destroy
        @product.destroy
        redirect_to products_path
    end

    def buy
        @user = User.find(params[:user_id])
        ProductResponseMailer.with(user: @user).response(@product).deliver_now
        @product.responsed_user_ids.push(@user.id)
        if @product.save
            redirect_to product_path(@product), notice: "You have successfully responded. Seller will contact you soon..."
        else
            flash[:alert] = "Something went wrong.Try again..."
        end
    end

    def responded
        @product.responsed_user_ids.each do |u|
            @user = User.find(u)
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
        if (current_user != @product.user && !is_admin?)
            flash[:alert] = "You can only edit or delete your own posted ads"
            redirect_to @product
        end
    end

    def set_categories
        @categories = Category.all.order(:name)
    end
end