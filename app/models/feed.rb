class Feed < ApplicationRecord
  require 'rss'
  require 'open-uri'

  before_create :set_title

  #validates :url, format: URI::regexp(/(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix)
  validates :url, url: true
  



  private 

  def set_title
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      self.title = feed.channel.title
    end
  end

end
