class AddApprovedByToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :approved_by, :string
  end
end
