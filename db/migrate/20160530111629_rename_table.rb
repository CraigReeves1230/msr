class RenameTable < ActiveRecord::Migration
  def change
    rename_table :matches, :results
  end
end
