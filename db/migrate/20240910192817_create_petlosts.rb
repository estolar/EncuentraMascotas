class CreatePetlosts < ActiveRecord::Migration[7.2]
  def change
    create_table :petlosts do |t|
      t.string :name
      t.boolean :finded
      t.string :breed
      t.string :color
      t.string :signs
      t.date :day_lost
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
