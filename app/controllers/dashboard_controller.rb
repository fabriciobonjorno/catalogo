class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  def index
    @total_products = Product.count
    @products_releases = Product.releases_true
    @products_status = Product.status_true
  end
end
