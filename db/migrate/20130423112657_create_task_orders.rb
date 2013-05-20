class CreateTaskOrders < ActiveRecord::Migration
  def change
    create_table :task_orders do |t|
      t.integer :game_id
      t.integer :team_id
      t.integer :task_id
      t.integer :order_n
      t.boolean :solved
      t.boolean :dropped
      t.datetime :time_start
      t.datetime :time_hint1
      t.datetime :time_hint2
      t.datetime :solve_time

      t.timestamps
    end
  end
end
