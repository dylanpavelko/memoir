class PagesController < ApplicationController
	before_filter :authenticate_user
	before_filter :authenticate_user

	def show
		render template: "pages/#{params[:page]}"
	end

	def tools
	end

	def viewPreferences
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
		@groups = Group.all
		@groups = @groups.select { |group| group.userHasAccess(@current_user) == true }
		@groups = @groups.select { |group| group.includedInViewingPreference(@current_user) == true }
		@groups = @groups.sort {|a, b| b.getOrder <=> a.getOrder}
		@groups = @groups.sort {|a,b| a.getDatePercision <=> b.getDatePercision}


	    @contentBlocks = ContentBlock.all
	    @characterTags = CharacterTag.all
	    @storylineTags = StorylineTag.all
	    @characters = GroupHasCharacter.all
	    @storylines = GroupHasStoryline.all
	end

	def set_last_group_viewed
	  @user = @current_user
      @user.update(:last_group_viewed => params[:last_group_viewed])
      render :nothing => true
    end

  def user_params
    params.require(:user).permit(:username, :email, :firstName, :lastName, :password, :role_id, :password_confirmation, :last_group_viewed)
  end

end
