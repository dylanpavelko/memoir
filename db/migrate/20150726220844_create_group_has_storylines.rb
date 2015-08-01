class CreateGroupHasStorylines < ActiveRecord::Migration
  def change
    create_table :group_has_storylines do |t|
      t.integer :group_id
      t.integer :storylineTag_id

      t.timestamps
    end
  end
end
