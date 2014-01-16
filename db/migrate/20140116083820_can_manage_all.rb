class CanManageAll < ActiveRecord::Migration

  def change
    add_column :roles, :can_manage_all, :boolean, :default => 0
    add_column :roles, :can_read, :boolean, :default => 1
    add_column :roles, :can_create, :boolean, :default => 0
    add_column :roles, :can_destroy, :boolean, :default => 0
  end
end
