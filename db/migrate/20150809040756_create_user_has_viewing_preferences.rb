class CreateUserHasViewingPreferences < ActiveRecord::Migration
  def change
    create_table :user_has_viewing_preferences do |t|
      t.references :user, index: true
      t.references :viewingPreference, index: true

      t.timestamps
    end
  end
end
