class FeedItemsController < ApplicationController
  before_action :set_feed, only: :destroy
  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @id = @feed_item.feed_id
    @feed_item.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed_item = FeedItem.find(params[:id])
      puts @feed_item.id
    end
end
