class AddGenderToPetlosts < ActiveRecord::Migration[7.2]
  def change
    add_column :petlosts, :gender, :string
  end
end
