module ExportProductsToPdf
  class << self
    require './lib/generate_pdf'

    def execute
      GeneratePdf.new.execute(products)
    end

    private

    def products
      Product.all
    end
  end 
end

