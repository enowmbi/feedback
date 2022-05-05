class TagsController < ApplicationController
  before_action :set_tag, only: %i[ show edit update destroy ]

  # GET /tags or /tags.json
  def index
    @tags = Tag.order(created_at: :desc)
  end

  # GET /tags/1 or /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags or /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.turbo_stream do
          render turbo_stream: [
               turbo_stream.update("new-tag", partial: "tags/form", locals: {tag: Tag.new}),
               turbo_stream.prepend("tags", partial: "tags/tag", locals: {tag: @tag}),
               turbo_stream.update("notice", html: "Tag was successfully created")
          ]
        end
        format.html { redirect_to tag_url(@tag), notice: "Tag was successfully created." }
        format.json { render :show, status: :created, location: @tag }
      else
        format.turbo_stream do
          render turbo_stream: [
               turbo_stream.update("new-tag", partial: "tags/form", locals: {tag: @tag}),
               turbo_stream.update("alert", html: "Tag was not successfully created")
          ]
        end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1 or /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tag_url(@tag), notice: "Tag was successfully updated." }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1 or /tags/1.json
  def destroy
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url, notice: "Tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:name, :description)
    end
end
