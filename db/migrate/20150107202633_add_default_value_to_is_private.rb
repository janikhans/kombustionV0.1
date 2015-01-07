class AddDefaultValueToIsPrivate < ActiveRecord::Migration
    def up
    change_column :rides, :is_private, :boolean, default: false
    end
  
    def down
    change_column :rides, :is_private, :boolean, default: nil
    end
end
