class AddPictureUomCategoryToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :picture, :string
    add_column :vehicles, :unit_of_measurement, :string
    add_column :vehicles, :category, :string
  end
end
