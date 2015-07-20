class AddKitpicToKits < ActiveRecord::Migration
  def change
    add_column :kits, :kitpic, :string
  end
end
