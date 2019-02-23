class AddFeedItemsCounterToFeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :feeds, :feed_items_count, :integer
  end
end
