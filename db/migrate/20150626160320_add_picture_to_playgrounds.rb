class AddPictureToPlaygrounds < ActiveRecord::Migration
  def change
    add_column :playgrounds, :picture, :string
  end
end
