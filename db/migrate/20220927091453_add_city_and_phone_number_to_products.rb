class AddCityAndPhoneNumberToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :city, :string
    add_column :products, :phone_number, :string
  end
end
