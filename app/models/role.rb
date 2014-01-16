class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  attr_accessible :name, :can_edit_users, :can_destroy, :can_create, :can_read, :can_manage_all
  scopify
  # attr_accessible :title, :body
end
