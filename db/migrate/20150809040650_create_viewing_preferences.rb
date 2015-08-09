class CreateViewingPreferences < ActiveRecord::Migration
  def change
    create_table :viewing_preferences do |t|
      t.integer :textDetailLevel
      t.integer :imageDetailLevel
      t.references :characterTag
      t.references :storylineTag
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end
end
