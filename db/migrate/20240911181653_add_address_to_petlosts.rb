class AddAddressToPetlosts < ActiveRecord::Migration[7.2]
  def change
    add_column :petlosts, :address, :string
  end
end
