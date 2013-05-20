class CreateTryes < ActiveRecord::Migration
  def change
    create_table :tryes do |t|
      t.integer :team_id
      t.string :code
      t.boolean :match

      t.timestamps
    end
  end
end
