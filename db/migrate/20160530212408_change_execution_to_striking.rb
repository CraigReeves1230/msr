class ChangeExecutionToStriking < ActiveRecord::Migration
  def change
    rename_column :wrestlers, :execution , :striking
  end
end
