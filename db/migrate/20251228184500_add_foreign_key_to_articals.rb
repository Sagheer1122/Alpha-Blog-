class AddForeignKeyToArticals < ActiveRecord::Migration[8.1]
  def change
    add_foreign_key :articals, :users
  end
end
