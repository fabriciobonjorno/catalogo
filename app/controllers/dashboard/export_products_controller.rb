module Dashboard
  class ExportProductsController < DashboardController
    def create
      ExportProductsToPdf.execute
      redirect_to dashboard_products_path(pdf: true)
    end
  end
end

