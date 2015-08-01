class GroupHasCharactersController < ApplicationController
  before_action :set_group_has_character, only: [:show, :edit, :update, :destroy]

  # GET /group_has_characters
  # GET /group_has_characters.json
  def index
    @group_has_characters = GroupHasCharacter.all
  end

  # GET /group_has_characters/1
  # GET /group_has_characters/1.json
  def show
  end

  # GET /group_has_characters/new
  def new
    @group_has_character = GroupHasCharacter.new
  end

  # GET /group_has_characters/1/edit
  def edit
  end

  # POST /group_has_characters
  # POST /group_has_characters.json
  def create
    @group_has_character = GroupHasCharacter.new(group_has_character_params)

    respond_to do |format|
      if @group_has_character.save
        format.html { redirect_to @group_has_character, notice: 'Group has character was successfully created.' }
        format.json { render :show, status: :created, location: @group_has_character }
      else
        format.html { render :new }
        format.json { render json: @group_has_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_has_characters/1
  # PATCH/PUT /group_has_characters/1.json
  def update
    respond_to do |format|
      if @group_has_character.update(group_has_character_params)
        format.html { redirect_to @group_has_character, notice: 'Group has character was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_has_character }
      else
        format.html { render :edit }
        format.json { render json: @group_has_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_has_characters/1
  # DELETE /group_has_characters/1.json
  def destroy
    @group_has_character.destroy
    respond_to do |format|
      format.html { redirect_to group_has_characters_url, notice: 'Group has character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_has_character
      @group_has_character = GroupHasCharacter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_has_character_params
      params.require(:group_has_character).permit(:group_id, :characterTag_id)
    end
end
