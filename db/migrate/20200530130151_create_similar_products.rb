class CreateSimilarProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :similar_products do |t|
      t.string :code
      t.string :description
      t.string :ean
      t.string :dun
      t.string :display
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
