module Dashboard
  class ImportProductsController < DashboardController
    def create
      InsertMaterialRecordByCsv.execute(
        import_products_params[:upload]
      )
      redirect_to dashboard_products_path,
        notice: 'Produto(s) cadastrado(s) com sucesso'
    end

    private

    def import_products_params
      params.require(:spreadsheet).permit(:upload)
    end
  end
end

