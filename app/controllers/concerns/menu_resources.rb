module MenuResources
  extend ActiveSupport::Concern

  private

  def set_resources
    @lines = Line.all
    @families = Family.order_family
    @groups = Group.order_group
  end
end
