# frozen_string_literal: true

class AddJtiToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :jti, :string, null: false, default: ''
    add_index :users, :jti, unique: true
  end
end
