# frozen_string_literal: true

module MenuResources
  extend ActiveSupport::Concern

  private

  def set_resources
    @lines = Line.order_family
    @groups = Group.order_group
  end
end
