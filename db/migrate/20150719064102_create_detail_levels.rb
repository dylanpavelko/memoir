class CreateDetailLevels < ActiveRecord::Migration
  def change
    create_table :detail_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
