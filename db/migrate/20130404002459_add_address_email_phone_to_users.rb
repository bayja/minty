class AddAddressEmailPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :text
    add_column :users, :email, :string
    add_column :users, :phone, :string
  end
end
