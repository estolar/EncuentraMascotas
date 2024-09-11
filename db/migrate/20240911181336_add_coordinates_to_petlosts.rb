class AddCoordinatesToPetlosts < ActiveRecord::Migration[7.2]
  def change
    add_column :petlosts, :latitude, :float
    add_column :petlosts, :longitude, :float
  end
end
