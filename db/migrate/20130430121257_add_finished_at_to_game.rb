class AddFinishedAtToGame < ActiveRecord::Migration
  def change
    add_column :games, :finished_at, :datetime, default: nil
  end
end
