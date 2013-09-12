class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'New category has been created.'
      redirect_to edit_admin_category_path(@category)
    else
      render 'new'
    end
  end

  def edit
    set_category
  end

  def update
    set_category
    if @category.update(category_params)
      flash[:success] = 'New category has been updated.'
      redirect_to edit_admin_category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    Category.destroy(params[:id])
    flash[:success] = 'Category has been deleted.'
    redirect_to admin_categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
