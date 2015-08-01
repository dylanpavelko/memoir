class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :chunk, index: true
      t.references :parentGroup, index: true
      t.references :storylineTag, index: true
      t.references :characterTag, index: true
      t.integer :age
      t.references :era, index: true
      t.date :contentDate
      t.references :detailLevel, index: true
      t.integer :order

      t.timestamps
    end
  end
end
