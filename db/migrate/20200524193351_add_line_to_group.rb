# frozen_string_literal: true

class AddLineToGroup < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :line, foreign_key: true
  end
end
