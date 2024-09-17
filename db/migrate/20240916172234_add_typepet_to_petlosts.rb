class AddTypepetToPetlosts < ActiveRecord::Migration[7.2]
  def change
    add_column :petlosts, :type_pet, :string
  end
end
