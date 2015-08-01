class CreateContentBlocks < ActiveRecord::Migration
  def change
    create_table :content_blocks do |t|
      t.references :contentType, index: true
      t.references :style, index: true
      t.text :content

      t.timestamps
    end
  end
end
