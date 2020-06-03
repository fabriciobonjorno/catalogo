# frozen_string_literal: true

class HomeController < ApplicationController
  layout 'home'
  include MenuResources
  before_action :set_resources, only: %i[index show]
  def index
    @products = Product.limit(9).releases_home

    # TODO: remove the code above before merge
    # GeneratePdfMaterialsRecordByCsv.execute
    # redirect_to '/products.pdf'
  end
end
