# frozen_string_literal: true

module GeneratePdfMaterialsRecordByCsv
  class << self
    require './lib/generate_pdf'

    def execute
      products = []
      csv.shift
      csv.each do |row|
        @row = row
        product = Product.create!(
          product_code: row[0], product_description: row[1], product_ean: row[3],
          tax_classification: tax_classification, group: group, family: family,
          line: line, product_dun: row[3]
        )
        products << product
      end
      GeneratePdf.material(products)
    end

    private

    def csv
      CSV.read('./lib/assets/materials_record.csv')
    end

    def tax_classification
      TaxClassification.first_or_create(tax_code: @row[2])
    end

    def group
      Group.first_or_create(group_code: @row[6], group_description: @row[7])
    end

    def family
      Family.first_or_create(
        family_code: @row[8], family_description: @row[9], group: group, line: line
      )
    end

    def line
      Line.first_or_create(line_description: @row[10])
    end
  end
end
