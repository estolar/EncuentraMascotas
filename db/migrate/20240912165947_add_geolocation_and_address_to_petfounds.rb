class AddGeolocationAndAddressToPetfounds < ActiveRecord::Migration[7.2]
  def change
    add_column :petfounds, :latitude, :float
    add_column :petfounds, :longitude, :float
    add_column :petfounds, :address, :string
  end
end
