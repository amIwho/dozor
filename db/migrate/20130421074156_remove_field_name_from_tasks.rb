class RemoveFieldNameFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :difficode, :code
  end

  def down
  end
end
