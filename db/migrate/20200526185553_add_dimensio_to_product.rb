# frozen_string_literal: true

class AddDimensioToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :status_dimension, :boolean
  end
end
