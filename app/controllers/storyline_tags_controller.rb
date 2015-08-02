class StorylineTagsController < ApplicationController
  before_action :set_storyline_tag, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user

  # GET /storyline_tags
  # GET /storyline_tags.json
  def index
    @storyline_tags = StorylineTag.all
  end

  # GET /storyline_tags/1
  # GET /storyline_tags/1.json
  def show
  end

  # GET /storyline_tags/new
  def new
    @storyline_tag = StorylineTag.new
  end

  # GET /storyline_tags/1/edit
  def edit
  end

  # POST /storyline_tags
  # POST /storyline_tags.json
  def create
    @storyline_tag = StorylineTag.new(storyline_tag_params)

    respond_to do |format|
      if @storyline_tag.save
        format.html { redirect_to @storyline_tag, notice: 'Storyline tag was successfully created.' }
        format.json { render :show, status: :created, location: @storyline_tag }
      else
        format.html { render :new }
        format.json { render json: @storyline_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storyline_tags/1
  # PATCH/PUT /storyline_tags/1.json
  def update
    respond_to do |format|
      if @storyline_tag.update(storyline_tag_params)
        format.html { redirect_to @storyline_tag, notice: 'Storyline tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @storyline_tag }
      else
        format.html { render :edit }
        format.json { render json: @storyline_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storyline_tags/1
  # DELETE /storyline_tags/1.json
  def destroy
    @storyline_tag.destroy
    respond_to do |format|
      format.html { redirect_to storyline_tags_url, notice: 'Storyline tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storyline_tag
      @storyline_tag = StorylineTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def storyline_tag_params
      params.require(:storyline_tag).permit(:name)
    end
end
