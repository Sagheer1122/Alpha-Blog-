class AddCategoryToArticals < ActiveRecord::Migration[8.1]
  def change
    add_column :articals, :category, :string
  end
end
