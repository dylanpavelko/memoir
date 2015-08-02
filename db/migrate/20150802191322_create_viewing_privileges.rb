class CreateViewingPrivileges < ActiveRecord::Migration
  def change
    create_table :viewing_privileges do |t|
      t.string :name
      t.references :characterTag
      t.references :storylineTag
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end
end
