# frozen_string_literal: true

class AddSlugColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :slug, :string, unique: true
  end
end
