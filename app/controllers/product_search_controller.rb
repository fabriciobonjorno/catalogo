class ProductSearchController < HomeController
  #include MenuResources
  #before_action :set_resources, only: %i[show]
  def search
    @products = Product.search(search_params[:q])
  end

  private

  def search_params
    params.permit(:q)
  end
end
