class CreateFeedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_items do |t|
      t.belongs_to :feed, foreign_key: true
      t.string :title
      t.string :link
      t.datetime :pub_date

      t.timestamps
    end
  end
end
