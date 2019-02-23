class Feed < ApplicationRecord
  require 'rss'
  require 'open-uri'

  has_many :feed_items, dependent: :destroy

  before_create :set_title, if: :is_valid_rss?

  validates :url, url: true, uniqueness: true
  #validates :title, presence: true


  def fetch_feed_items
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items.each do |item|
        self.feed_items << FeedItem.create(title: item.title, link: item.link, pub_date: item.pubDate)
      end
    end 
  end

  private 

  def set_title
    open(url) do |rss|  
      feed = RSS::Parser.parse(rss)
      self.title = feed.channel.title
    end
  end

  def is_valid_rss?
    rss = begin
          true if RSS::Parser.parse(open(url))
        rescue
          errors.add(:base, "RSS not well formed")
          false
        end
  end 


end
