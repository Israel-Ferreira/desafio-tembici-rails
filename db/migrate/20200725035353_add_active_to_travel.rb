class AddActiveToTravel < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :active, :boolean, default: true
  end
end
