class AddResponsedUserIdsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :responsed_user_ids, :int, array: true, default: []
  end
end
