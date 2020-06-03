# frozen_string_literal: true

module GeneratePdfMaterialsRecordByCsv
  class << self
    def execute
      CSV.foreach('./lib/assets/materials_record.csv') do |row|
        puts row
      end
    end
  end
end
