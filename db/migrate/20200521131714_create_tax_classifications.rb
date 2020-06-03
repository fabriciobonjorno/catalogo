# frozen_string_literal: true

class CreateTaxClassifications < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_classifications do |t|
      t.string :tax_code

      t.timestamps
    end
  end
end
