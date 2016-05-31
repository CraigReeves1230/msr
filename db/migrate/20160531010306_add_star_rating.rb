class AddStarRating < ActiveRecord::Migration
  def change
    add_column(:wrestlers, :star_rating, :string)
  end
end
