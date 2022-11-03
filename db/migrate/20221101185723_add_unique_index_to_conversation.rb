class AddUniqueIndexToConversation < ActiveRecord::Migration[6.1]
  def change
    add_index :conversations, %i[sender_id receiver_id], unique: true
  end
end
