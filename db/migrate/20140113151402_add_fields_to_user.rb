class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :second_name, :string
    add_column :users, :birth_date, :date
  end
end
