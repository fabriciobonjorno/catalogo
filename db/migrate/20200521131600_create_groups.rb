# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :group_code
      t.string :group_description

      t.timestamps
    end
  end
end
