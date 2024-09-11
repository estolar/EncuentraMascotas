class RemoveAddressLostFromPetlosts < ActiveRecord::Migration[7.2]
  def change
    remove_column :petlosts, :address_lost, :string
  end
end
