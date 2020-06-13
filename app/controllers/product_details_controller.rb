class ProductDetailsController < HomeController
  #include MenuResources
  #before_action :set_resources, only: %i[show]
  def show
    @product = Product.limit(9).friendly.find(params[:id])
    @product_dimension = Product.status_dimension

    #@similar_products = @product.parent&.sub_products.where.not(id: @product.id)
  end
end
