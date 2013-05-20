class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :cap
      t.string :phone
      t.boolean :confirm
      t.string :login
      t.string :password_digest

      t.timestamps
    end
  end
end
