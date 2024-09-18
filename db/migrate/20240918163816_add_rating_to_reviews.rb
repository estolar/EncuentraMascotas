class AddRatingToReviews < ActiveRecord::Migration[7.2]
  def change
    add_column :reviews, :rating, :integer
  end
end
