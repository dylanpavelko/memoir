class CreateGroupHasCharacters < ActiveRecord::Migration
  def change
    create_table :group_has_characters do |t|
      t.integer :group_id
      t.integer :characterTag_id

      t.timestamps
    end
  end
end
