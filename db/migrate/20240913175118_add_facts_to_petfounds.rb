class AddFactsToPetfounds < ActiveRecord::Migration[7.2]
  def change
    add_column :petfounds, :facts, :string
  end
end
