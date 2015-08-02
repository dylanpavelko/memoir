class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    @contentBlocks = ContentBlock.all
    @characterTags = CharacterTag.all
    @storylineTags = StorylineTag.all
    @characters = GroupHasCharacter.all
    @storylines = GroupHasStoryline.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @contentBlock = ContentBlock.find(@group.chunk_id)
    @characterTags = CharacterTag.all
    @characters = GroupHasCharacter.where(:group_id => @group.id)
    @storylineTags = StorylineTag.all
    @storylines = GroupHasStoryline.where(:group_id => @group.id)

  end

  # GET /groups/new
  def new
    @group = Group.new
    @content_block = ContentBlock.new
  end

  # GET /groups/1/edit
  def edit
    @contentBlockID = @group[:chunk_id]
    @content_block = ContentBlock.where(:id => @contentBlockID).first

    @groupAlreadyHasCharacters = GroupHasCharacter.where(:group_id => @group.id).map(&:characterTag_id)
    @groupAlreadyHasStorylines = GroupHasStoryline.where(:group_id => @group.id).map(&:storylineTag_id)
  end

  # POST /groups
  # POST /groups.json
  def create
    @contentBlock = ContentBlock.new(:contentType_id => params[:content_block][:contentType_id], :style_id => params[:content_block][:style_id], 
           :content => params[:content_block][:content])
    @contentBlock.save

    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        @group.update_attributes(chunk_id: @contentBlock.id)
        sync_character_tags()
        sync_storyline_tags()
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @contentBlockID = @group[:chunk_id]
    @contentBlock = ContentBlock.where(:id => @contentBlockID).first
    @contentBlock.update(:contentType_id => params[:content_block][:contentType_id], :style_id => params[:content_block][:style_id], 
           :content => params[:content_block][:content])
    @contentBlock.save
    respond_to do |format|
      if @group.update(group_params)
        sync_character_tags()
        sync_storyline_tags()
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:chunk_id, :parentGroup_id, :storylineTags, :age, :era_id, :contentDate, :detailLevel_id, :order, :characterTags, :content_block)
    end

  def group_has_character?(characterTag)
    @groupAlreadyHasCharacters.exists?(:characterTag_id => characterTag)
  end 

  def selection_has_character?(characterTag)
    @selectedCharacters.include?(characterTag)
  end 

  def sync_character_tags()
    @characters = CharacterTag.all

    @groupAlreadyHasCharacters = GroupHasCharacter.where(:group_id => @group.id)  

    @selectedCharacterIds = params[:characterTags][:id]
    @selectedCharacterIds.pop
    @selectedCharacters = CharacterTag.find(@selectedCharacterIds)
    puts "sync up character tags"
    @characters.each do |character |
      puts character.id
      if(selection_has_character?(character))
        puts "character selected"
        @groupCharacter = GroupHasCharacter.where(:group_id => @group.id, :characterTag_id => character.id).first_or_create
        @groupCharacter.save
      elsif(group_has_character?(character))
        @groupCharacter = GroupHasCharacter.where(:group_id => @group.id, :characterTag_id => character.id).first
        @groupCharacter.destroy
        puts "character not selected"
      end

    end
  end

  def group_has_storyline?(storylineTag)
    @groupAlreadyHasStorylines.exists?(:storylineTag_id => storylineTag)
  end 

  def selection_has_storyline?(storylineTag)
    @selectedStorylines.include?(storylineTag)
  end 

  def sync_storyline_tags()
    @storylines = StorylineTag.all

    @groupAlreadyHasStorylines = GroupHasStoryline.where(:group_id => @group.id)  

    @selectedStorylineIds = params[:storylineTags][:id]
    @selectedStorylineIds.pop
    @selectedStorylines = StorylineTag.find(@selectedStorylineIds)
    puts "sync up storyline tags"
    @storylines.each do |storyline |
      puts storyline.id
      if(selection_has_storyline?(storyline))
        puts "storyline selected"
        @groupStoryline = GroupHasStoryline.where(:group_id => @group.id, :storylineTag_id => storyline.id).first_or_create
        @groupStoryline.save
      elsif(group_has_storyline?(storyline))
        @groupStoryline = GroupHasStoryline.where(:group_id => @group.id, :storylineTag_id => storyline.id).first
        @groupStoryline.destroy
        puts "storyline not selected"
      end

    end
  end

end
