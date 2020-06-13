class FamilyDetailsController < HomeController
  #include MenuResources
  #before_action :set_resources, only: %i[show]
  def show
    @family = Family.find(params[:id])
    @products = Product.order(:product_code).page(params[:page]).per(9)   
  end
end
