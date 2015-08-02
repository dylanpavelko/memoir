class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_reference :users, :role, index: true
  end
end
