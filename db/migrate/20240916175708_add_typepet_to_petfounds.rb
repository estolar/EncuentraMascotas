class AddTypepetToPetfounds < ActiveRecord::Migration[7.2]
  def change
    add_column :petfounds, :type_pet, :string
  end
end
