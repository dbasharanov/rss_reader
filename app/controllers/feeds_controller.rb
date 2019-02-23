class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  # GET /feeds
  # GET /feeds.json
  def index
    @feed_items = FeedItem.newest.page(params[:page]).per(10)
    respond_to do |format|
      format.html {  }
      format.js {  }
    end 
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    @feed_items = @feed.feed_items.newest.page(params[:page]).per(10)
    respond_to do |format|
      format.html {  }
      format.js { render :index }
    end 
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      begin
        @feed.save
        @feed.fetch_feed_items

        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
      rescue
        format.html { render :new, notice: @feed.errors.full_messages.join(',')}
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      format.js   { render layout: false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.require(:feed).permit(:url, :title)
    end
end
