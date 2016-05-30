class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.float :execution
      t.float :heat
      t.float :action
      t.float :layout
      t.float :selling
      t.boolean :factoring_heat
      t.float :score
      t.string :star_rating

      t.timestamps null: false
    end
  end
end
