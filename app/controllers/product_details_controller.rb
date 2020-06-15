class ProductDetailsController < HomeController
  #include MenuResources
  #before_action :set_resources, only: %i[show]
  def show
    @product = Product.friendly.find(params[:id])
    @product_dimension = Product.status_dimension
  end
end
