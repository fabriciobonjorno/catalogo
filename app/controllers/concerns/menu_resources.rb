# frozen_string_literal: true

module MenuResources
  extend ActiveSupport::Concern

  private

  def set_resources
    @lines = Line.all
    @groups = Group.all
    @families = Family.all
  end
end
