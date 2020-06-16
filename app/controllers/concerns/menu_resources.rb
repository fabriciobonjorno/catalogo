# frozen_string_literal: true

module MenuResources
  extend ActiveSupport::Concern

  private

  def set_resources
    @lines = Line.all
    @groups = Group.order(group_description: :asc)
    @families = Family.order(family_description: :asc)
  end
end
