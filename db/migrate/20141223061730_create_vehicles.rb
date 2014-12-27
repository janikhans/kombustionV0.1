class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :name
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :vehicles, :users
  end
end
