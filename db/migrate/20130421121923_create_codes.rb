class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :name
      t.string :dif
      t.integer :task_id

      t.timestamps
    end
  end
end
