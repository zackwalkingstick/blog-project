class EntriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_blog, only: [:create]
  before_action :set_creator, only: [:create]
  before_action :set_entry, only: %i[ show edit update destroy ]

  # GET /entries or /entries.json
  def index
    @entries = Entry.all
  end

  # GET /entries/1 or /entries/1.json
  def show
    respond_to do |format|
      if @entry.present?
        format.json { render json: @entry, status: :ok }
      end
    end
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries or /entries.json
  def create
    Rails.logger.info entry_params.inspect
    params = {
      "title": entry_params['title'],
      "content": { 'text': entry_params['text'] }
    }
    @entry = Entry.new(params)
    @entry.blog = @blog
    @entry.creator = @creator

    Rails.logger.info @entry.inspect
    respond_to do |format|
      if @entry.save
        format.html { redirect_to entry_url(@entry), notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    @entry.title = entry_params['title'] if entry_params['title'].present?
    @entry.content = { 'text': entry_params['text'] } if entry_params['text'].present?

    respond_to do |format|
      if @entry.save
        format.html { redirect_to entry_url(@entry), notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url, notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_blog
    # TODO: don't hard code this
    @blog = Blog.where(name: 'Middle Kid Memes').first
  end

  def set_creator
    # TODO: don't hard code this
    @creator = User.first_or_create!(first_name: 'Zack', last_name: 'Walkingstick', email: 'zackwalkingstick@gmail.com')
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entry_params
    params.require(:entry).permit(:title, :text)
  end
end
