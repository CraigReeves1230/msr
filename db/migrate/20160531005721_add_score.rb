class AddScore < ActiveRecord::Migration
  def change
    add_column(:wrestlers, :score, :float)
  end
end
