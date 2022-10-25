class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.text :review_body
      t.boolean :is_approved, default: false

      t.timestamps
    end
  end
end
