class AddIsAdminToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :is_admin, :boolean
  end
end
