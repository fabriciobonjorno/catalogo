module Dashboard
  class ExportProductsController < DashboardController
    def create
      ExportProductsToPdf.execute
      redirect_to '/products.pdf'
    end
  end
end

