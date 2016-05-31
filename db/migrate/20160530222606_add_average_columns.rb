class AddAverageColumns < ActiveRecord::Migration
  def change
    add_column(:wrestlers, :execution, :float)
  end
end
