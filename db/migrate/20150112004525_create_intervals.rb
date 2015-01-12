class CreateIntervals < ActiveRecord::Migration
  def change
    create_table :intervals do |t|
      t.string :description
      t.integer :length
      t.string :group
      t.string :action
      t.boolean :recommended
      t.string :unit_of_measurement
      t.references :intervaled, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
