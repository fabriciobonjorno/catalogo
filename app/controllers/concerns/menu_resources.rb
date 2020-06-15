# frozen_string_literal: true

module MenuResources
  extend ActiveSupport::Concern

  private

  def set_resources
    @lines = Line.all
    @families = Family.order(:family_description)
    @groups = Group.order(:group_description)
  end
end
