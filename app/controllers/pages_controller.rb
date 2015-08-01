class PagesController < ApplicationController
	def show
		render template: "pages/#{params[:page]}"
	end

	def home
	 @group = Group.new
	 @groups = Group.all.sort {|a, b| b.getOrder <=> a.getOrder}
	 @groups = @groups.sort {|a,b| a.getDatePercision <=> b.getDatePercision}


    @contentBlocks = ContentBlock.all
    @characterTags = CharacterTag.all
    @storylineTags = StorylineTag.all
    @characters = GroupHasCharacter.all
    @storylines = GroupHasStoryline.all
	end

	def view
	 @groups = Group.all.sort {|a, b| b.getOrder <=> a.getOrder}
	 @groups = @groups.sort {|a,b| a.getDatePercision <=> b.getDatePercision}


    @contentBlocks = ContentBlock.all
    @characterTags = CharacterTag.all
    @storylineTags = StorylineTag.all
    @characters = GroupHasCharacter.all
    @storylines = GroupHasStoryline.all
	end
end
