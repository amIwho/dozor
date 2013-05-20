class CreateRgames < ActiveRecord::Migration
  def change
    create_table :rgames do |t|
      t.integer :game_id
      t.integer :team_id
      t.integer :current_task_id
      t.datetime :finished_at
      t.datetime :current_task_entered_at
      t.string :answered_questions, default: []

      t.timestamps
    end
  end
end
