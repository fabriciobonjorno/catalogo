# frozen_string_literal: true

module MenuResources
  extend ActiveSupport::Concern

  private

  def set_resources
    @lines = Line.order(:family_description, :desc)
    @groups = Group.order(:group_description, :desc)
  end
end
