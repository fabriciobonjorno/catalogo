class FamilyDetailsController < HomeController
  #include MenuResources
  #before_action :set_resources, only: %i[show]
  def show
    @family = Family.find(params[:id])
  end
end
