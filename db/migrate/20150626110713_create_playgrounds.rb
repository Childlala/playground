class CreatePlaygrounds < ActiveRecord::Migration
  def change
    create_table :playgrounds do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
