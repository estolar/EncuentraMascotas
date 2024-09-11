class RemoveLatitudeAndLongitudeFromPetlosts < ActiveRecord::Migration[7.2]
  def change
    remove_column :petlosts, :latitude, :float
    remove_column :petlosts, :longitude, :float
  end
end
