require 'rails_helper'

RSpec.describe FeedItemsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Feed. As you add validations to Feed, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FeedsController. Be sure to keep this updated too.
  let(:valid_session) { {} }


  describe "DELETE #destroy" do
    it "destroys the requested feed_item" do
      feed_item = FeedItem.create! valid_attributes
      expect {
        delete :destroy, params: {id: feed_item.to_param}, session: valid_session
      }.to change(FeedItem, :count).by(-1)
    end

    it "redirects to the feed_items list" do
      feed_item = FeedItem.create! valid_attributes
      delete :destroy, params: {id: feed_item.to_param}, session: valid_session
      expect(response).to redirect_to(feed_items_url)
    end
  end

end
