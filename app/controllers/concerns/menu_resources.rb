# frozen_string_literal: true

module MenuResources
  extend ActiveSupport::Concern

  private

  def set_resources
    @lines = Line.all
    @families = Group.families.order_family
    @groups = Line.groups.order_group
  end
end
