class ContentBlocksController < ApplicationController
  before_action :set_content_block, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user
  before_filter :author_only

  # GET /content_blocks
  # GET /content_blocks.json
  def index
    @content_blocks = ContentBlock.all
  end

  # GET /content_blocks/1
  # GET /content_blocks/1.json
  def show
  end

  # GET /content_blocks/new
  def new
    @content_block = ContentBlock.new
    # @group = Group.new
  end

  # GET /content_blocks/1/edit
  def edit
  end

  # POST /content_blocks
  # POST /content_blocks.json
  def create
    @content_block = ContentBlock.new(content_block_params)

    respond_to do |format|
      if @content_block.save

#         @group = Group.new(:chunk_id => @content_block.id, :age => params[:group][:age], :era_id => params[:group][:era_id], 
#           :contentDate => params[:group][:contentDate] , :detailLevel_id => params[:group][:detailLevel_id], :order => params[:group][:order])
#         @group.save
#         @selectedCharacters = params[:group][:characterTags]
# puts "testing"
# puts @selectedCharacters        
#         @group.sync_character_tags(@group, @selectedCharacters)
 #       @group.sync_storyline_tags

        format.html { redirect_to @content_block, notice: 'Content block was successfully created.' }
        format.json { render :show, status: :created, location: @content_block }
      else
        format.html { render :new }
        format.json { render json: @content_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content_blocks/1
  # PATCH/PUT /content_blocks/1.json
  def update
    respond_to do |format|
      if @content_block.update(content_block_params)

        # @group = Group.update(:chunk_id => @content_block.id, :age => params[:group][:age], :era_id => params[:group][:era_id], 
        #   :contentDate => params[:group][:contentDate] , :detailLevel_id => params[:group][:detailLevel_id], :order => params[:group][:order])
        # @group.save
        # @group.sync_character_tags(@group, params[:group][:characterTags])

        format.html { redirect_to @content_block, notice: 'Content block was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_block }
      else
        format.html { render :edit }
        format.json { render json: @content_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_blocks/1
  # DELETE /content_blocks/1.json
  def destroy
    @content_block.destroy
    respond_to do |format|
      format.html { redirect_to content_blocks_url, notice: 'Content block was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_block
      @content_block = ContentBlock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_block_params
      params.require(:content_block).permit(:contentType_id, :style_id, :content, :group)
    end

end
