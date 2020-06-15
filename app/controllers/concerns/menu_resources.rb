# frozen_string_literal: true

module MenuResources
  extend ActiveSupport::Concern

  private

  def set_resources
    @lines = Line.all
    @groups = Group.order('group_code DESC').reorder('id ASC').order('group_description ASC')
    
  end
end
