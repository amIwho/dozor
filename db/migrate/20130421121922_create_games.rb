class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.datetime :date
      t.text :legend
      t.string :author
      t.string :area
      t.text :equipment
      t.text :coments

      t.timestamps
    end
  end
end
