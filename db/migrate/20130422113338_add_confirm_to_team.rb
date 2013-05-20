class AddConfirmToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :confirm, :bool
	add_column :teams, :login, :string
	add_column :teams, :password, :string
  end
end
