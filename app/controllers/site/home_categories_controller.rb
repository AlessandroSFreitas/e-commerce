class Site::HomeCategoriesController < SiteController
  def show
    @categories = Category.order_by_description
    @category = Category.friendly.find(params[:id])
    @ads = Ad.list_for_categories(@category)
  end
end
