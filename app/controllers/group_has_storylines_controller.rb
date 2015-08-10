class GroupHasStorylinesController < ApplicationController
  before_action :set_group_has_storyline, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user
  before_filter :author_only

  # GET /group_has_storylines
  # GET /group_has_storylines.json
  def index
    @group_has_storylines = GroupHasStoryline.all
  end

  # GET /group_has_storylines/1
  # GET /group_has_storylines/1.json
  def show
  end

  # GET /group_has_storylines/new
  def new
    @group_has_storyline = GroupHasStoryline.new
  end

  # GET /group_has_storylines/1/edit
  def edit
  end

  # POST /group_has_storylines
  # POST /group_has_storylines.json
  def create
    @group_has_storyline = GroupHasStoryline.new(group_has_storyline_params)

    respond_to do |format|
      if @group_has_storyline.save
        format.html { redirect_to @group_has_storyline, notice: 'Group has storyline was successfully created.' }
        format.json { render :show, status: :created, location: @group_has_storyline }
      else
        format.html { render :new }
        format.json { render json: @group_has_storyline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_has_storylines/1
  # PATCH/PUT /group_has_storylines/1.json
  def update
    respond_to do |format|
      if @group_has_storyline.update(group_has_storyline_params)
        format.html { redirect_to @group_has_storyline, notice: 'Group has storyline was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_has_storyline }
      else
        format.html { render :edit }
        format.json { render json: @group_has_storyline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_has_storylines/1
  # DELETE /group_has_storylines/1.json
  def destroy
    @group_has_storyline.destroy
    respond_to do |format|
      format.html { redirect_to group_has_storylines_url, notice: 'Group has storyline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_has_storyline
      @group_has_storyline = GroupHasStoryline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_has_storyline_params
      params.require(:group_has_storyline).permit(:group_id, :storylineTag_id)
    end
end
