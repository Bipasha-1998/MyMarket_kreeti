class AddCategoryIdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :category_id, :int
  end
end
