class PagesController < ApplicationController
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

	    @userViewingPreferences = UserHasViewingPreference.where(:user_id => @current_user)
    	if @userViewingPreferences.count > 0
    		@existing_viewing_preference = ViewingPreference.where(:id => @userViewingPreferences.first.viewingPreference_id).first
    		@viewing_preference = ViewingPreference.new
    	else
		    @viewing_preference = ViewingPreference.new
		end
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

    def set_user_view_preferences
    	@user = @current_user
    	@startYear = params[:viewing_preference][:startDate]
    	@endYear = params[:viewing_preference][:endDate]
    	@start = Date.new(@startYear.to_i,1,1)
    	@end = Date.new(@endYear.to_i,1,1)
    	@imageDetails = params[:viewing_preference][:imageDetail]
    	@textDetails = params[:viewing_preference][:textDetail]

		@userViewingPreferences = UserHasViewingPreference.where(:user_id => @current_user)
    	if @userViewingPreferences.count > 0
    		@viewingPreference = ViewingPreference.where(:id => @userViewingPreferences.first.viewingPreference_id).first
    		@viewingPreference = @viewingPreference.update_attributes(:startDate => @start, :endDate => @end , :textDetailLevel => @textDetails,:imageDetailLevel => @imageDetails)
    		#update
    	else
    		#add a viewing viewing_preference 
    		@viewingPreference = ViewingPreference.new(:startDate => @start, :endDate => @end , :textDetailLevel => @textDetails,:imageDetailLevel => @imageDetails)
    		@viewingPreference.save
    		@userViewingPreference = UserHasViewingPreference.new(:user_id => @current_user.id, :viewingPreference_id => @viewingPreference.id)
    		@userViewingPreference.save
    		#link it to the user
    	end
    	redirect_to(:action => 'view')
    end

  def user_params
    params.require(:user).permit(:username, :email, :firstName, :lastName, :password, :role_id, :password_confirmation, :last_group_viewed, :viewing_preference)
  end

end
