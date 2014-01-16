class CanEditUser < ActiveRecord::Migration
  def change
    add_column  :roles, :can_edit_users, :boolean, :default => 0
  end
end
