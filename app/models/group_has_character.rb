class GroupHasCharacter < ActiveRecord::Base
	belongs_to :characterTag, :class_name=>"CharacterTag", :foreign_key=>"characterTag_id"
	belongs_to :group, :class_name=>"Group", :foreign_key=>"group_id"
end
