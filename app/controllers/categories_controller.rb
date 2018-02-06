class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save 
      flash[:success] = "#{@category.title} added!"
      redirect_to categories_path
    else
      flash[:success] = "#{@category.title} already exist!"
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save
      flash[:success] = "#{@category.title} was successfully updated!"
      redirect_to categories_path
    else
      flash[:error] = "Sorry we could not update category"
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    flash[:success] = "#{category.title} was successfully deleted!"
    redirect_to categories_path
  end


  private

  def category_params
    params.require(:category).permit(:title)
  end
end