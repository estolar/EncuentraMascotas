class RenameAddressToAddressLostInPetlosts < ActiveRecord::Migration[7.2]
  def change
    rename_column :petlosts, :address, :address_lost
  end
end
