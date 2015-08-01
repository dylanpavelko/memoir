class CreateChunks < ActiveRecord::Migration
  def change
    create_table :chunks do |t|
      t.references :style, index: true

      t.timestamps
    end
  end
end
