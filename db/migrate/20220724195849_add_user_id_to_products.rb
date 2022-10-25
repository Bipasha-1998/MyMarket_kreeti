class AddUserIdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :user_id, :int
  end
end
