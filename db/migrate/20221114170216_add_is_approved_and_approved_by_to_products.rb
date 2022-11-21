class AddIsApprovedAndApprovedByToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :is_approved, :boolean, default: false
    add_column :products, :approved_by, :string
  end
end
