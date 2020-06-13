class FamilyDetailsController < HomeController
  #include MenuResources
  #before_action :set_resources, only: %i[show]
  def show
    @family = Family.page(params[:page]).per(9).find(params[:id])
  end
end
