# frozen_string_literal: true

module MenuResources
  extend ActiveSupport::Concern

  private

  def set_resources
    @lines = Line.all
    @groups = Group.all.order(group_description: :desc)
  end
end
