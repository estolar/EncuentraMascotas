class CreatePetfounds < ActiveRecord::Migration[7.2]
  def change
    create_table :petfounds do |t|
      t.string :details
      t.string :breed
      t.string :color
      t.string :signs
      t.date :day_found
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
