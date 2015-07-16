class Add < ActiveRecord::Migration
  def change
    add_reference :playgrounds, :user, index: true, foreign_key: true
  end
end
