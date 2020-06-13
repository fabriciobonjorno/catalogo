class FamilyDetailsController < HomeController
  #include MenuResources
  #before_action :set_resources, only: %i[show]
  def show
    @family = Family.find(params[:id])
    @products = @family.products.page(params[:page]).per(1)
  end
end
