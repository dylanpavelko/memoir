class CreateEras < ActiveRecord::Migration
  def change
    create_table :eras do |t|
      t.string :name
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end
end
