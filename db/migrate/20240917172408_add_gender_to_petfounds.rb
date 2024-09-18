class AddGenderToPetfounds < ActiveRecord::Migration[7.2]
  def change
    add_column :petfounds, :gender, :string
  end
end
