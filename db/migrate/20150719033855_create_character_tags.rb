class CreateCharacterTags < ActiveRecord::Migration
  def change
    create_table :character_tags do |t|
      t.string :name
      t.string :relationship
      t.references :relationshipType, index: true
      t.string :nickname

      t.timestamps
    end
  end
end
