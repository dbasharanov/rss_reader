class FeedItem < ApplicationRecord
  belongs_to :feed, counter_cache: true
  validates :feed, :title, :pub_date, presence: true

  validates :link, url: true, uniqueness: true

  scope :newest, -> { order(pub_date: :desc) }
end
