class AddIsauthorToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :isauthor, :boolean
  end
end
