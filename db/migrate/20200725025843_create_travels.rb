class CreateTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :travels do |t|
      t.datetime :started_date, nul: false, default: DateTime.now
      t.datetime :end_date
      t.references :category, null: false, foreign_key: true
      t.integer :grade

      t.timestamps
    end
  end
end
