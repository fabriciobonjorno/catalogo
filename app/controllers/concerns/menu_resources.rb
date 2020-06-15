# frozen_string_literal: true

module MenuResources
  extend ActiveSupport::Concern

  private

  def set_resources
    @lines = Line.all
    @families = Line.family.order_family
    @groups = Line.group.order_family
  end
end
