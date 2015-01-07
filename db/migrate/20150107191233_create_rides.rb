class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :name
      t.string :unit_of_measurement
      t.string :category
      t.string :picture
      t.boolean :private
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :rides, :users
  end
end
