class AddDefaultToFindedInPetlosts < ActiveRecord::Migration[7.2]
  def change
    change_column_default :petlosts, :finded, false
  end
end
