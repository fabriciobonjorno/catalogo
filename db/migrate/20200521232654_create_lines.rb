# frozen_string_literal: true

class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.string :line_description

      t.timestamps
    end
  end
end
