class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :fulltext
      t.string :code
      t.string :image_url
      t.integer :game_id
      t.string :location
      t.text :hint1
      t.text :hint2
      t.integer :difficode
      t.text :comments

      t.timestamps
    end
  end
end
