class AddImageUrlToCharacterTagsName < ActiveRecord::Migration
  def change
    add_column :character_tags, :image_url, :string
  end
end
