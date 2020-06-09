# frozen_string_literal: true

class HomeController < ApplicationController
  layout 'home'
  include MenuResources
  before_action :set_resources, only: %i[index show]
  def index
    @products = Product.order(:product_code).releases_home.page(params[:page]).per(9)
 
    # TODO: remove the code above before merge
    # GeneratePdfMaterialsRecordByCsv.execute
    # redirect_to '/products.pdf'
  end
end
