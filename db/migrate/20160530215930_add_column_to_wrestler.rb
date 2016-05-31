class AddColumnToWrestler < ActiveRecord::Migration
  def change
    add_column(:wrestlers, :name, :string)
  end
end
