class AddLastGroupViewedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_group_viewed, :integer
  end
end
