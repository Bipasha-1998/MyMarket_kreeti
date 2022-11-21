class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]
  skip_before_action :require_user, only: %i[index show]
  before_action :require_admin, except: %i[index show]

  def index
    @categories = Category.page(params[:page])
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.page(params[:page])
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category added successfully!'
      redirect_to categories_path
    else
      flash.now[:alert] = "Something went wrong. Couldn't add category. Try again"
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category updated!'
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = 'Category removed!'
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
