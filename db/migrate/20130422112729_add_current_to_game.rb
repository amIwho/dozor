class AddCurrentToGame < ActiveRecord::Migration
  def change
    add_column :games, :current, :bool
  end
end
