class ProductCategoriesController < ApplicationController

  before_action :set_all_categories, only: [:index, :show]
  before_action :authenticate_user, only: [:api_request]


  def index
    @all_products = Product.all.paginate(page: params[:page], per_page: 20)
  end

  def show
    @product_category = ProductCategory.find(params[:id])
    @products = @product_category.products.paginate(page: params[:page], per_page: 20)
  end

  def api_request
    render json: Product.all.limit(5)
  end

  private

  def set_all_categories
    @all_categories = ProductCategory.all
  end

end
