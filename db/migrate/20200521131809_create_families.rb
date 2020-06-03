# frozen_string_literal: true

class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.integer :family_code
      t.string :family_description
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
