class Site::HomeCategoriesController < SiteController
  def show
    @categories = Category.order_by_description
    @ads = Ad.list_for_categories(params[:id])
  end
end
