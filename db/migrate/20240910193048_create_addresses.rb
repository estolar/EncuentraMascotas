class CreateAddresses < ActiveRecord::Migration[7.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :aparment
      t.string :zip_code
      t.string :references
      t.string :city
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude
      t.references :petfound, null: false, foreign_key: true
      t.references :petlost, null: false, foreign_key: true

      t.timestamps
    end
  end
end
