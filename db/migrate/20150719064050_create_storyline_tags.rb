class CreateStorylineTags < ActiveRecord::Migration
  def change
    create_table :storyline_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
