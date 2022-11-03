class CategoriesController < ApplicationController
    before_action :set_category, only: [:edit, :update, :destroy]
    before_action :require_admin, except: [:index, :show]

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
        @products = @category.products.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "Category added successfully!"
            redirect_to categories_path
        else
            flash[:alert] = "Something went wrong. Couldn't add category. Try again"
            render 'new'
        end
    end

    def edit
    end

    def update
        if @category.update(category_params)
            flash[:notice] = "Category updated!"
            redirect_to categories_path
        else
            render 'edit'
        end
    end

    def destroy
        @category.destroy
        flash[:notice] = "Category removed!"
        redirect_to categories_path
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end

    def set_category
        @category = Category.find(params[:id])
    end

end