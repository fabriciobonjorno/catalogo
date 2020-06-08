# frozen_string_literal: true

module GeneratePdfMaterialsRecordByCsv
  class << self
    require './lib/generate_pdf'
    require 'roo'

    def execute(file)
      products = []
      spreadsheet = open_spreadsheet(file)
        Product.transaction do
          spreadsheet.each_row_streaming(offset: 1) do |row|
            return if row[0].cell_value.nil?

            @row = row
            product = Product.create!(
              product_code: row[0].cell_value.strip,
              product_description: row[1].cell_value.strip,
              product_ean: row[3].cell_value.strip,
              product_dun: row[3].cell_value.strip,
              tax_classification: tax_classification, group: group,
              family: family
            )
            products << product
          end
        end
        #TODO: GeneratePdf.material(products)
    end

    private

    def open_spreadsheet(file)
      case File.extname(file.original_filename)
      when ".csv" then Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end

    def csv
      CSV.read('./lib/assets/materials_record.csv')
    end

    def tax_classification
      TaxClassification.first_or_create(tax_code: @row[2].cell_value.strip)
    end

    def group
      Group.first_or_create!(
        group_code: @row[6].cell_value.strip,
        group_description: @row[7].cell_value.strip,
        line: line
      )
    end

    def family
      Family.first_or_create!(
        family_code: @row[8].cell_value.strip,
        family_description: @row[9].cell_value.strip, group: group
      )
    end

    def line
      Line.first_or_create!(line_description: @row[10])
    end
  end
end

