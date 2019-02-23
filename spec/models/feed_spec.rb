require 'rails_helper'

RSpec.describe Feed, type: :model do
  subject { described_class.new }
  
  it "is valid with valid attributes" do
    subject.url = "http://feeds.reuters.com/reuters/sportsNews"
    subject.title = "Sport"
    expect(subject).to be_valid
  end

  it "is not valid without an url" do
    expect(subject).to_not be_valid
  end
  
  it "is not valid an url" do
    subject.url = "https://example.com"
    expect(subject.send(:is_valid_rss?)).to be false
  end

  it "should have many items" do
    f = Feed.reflect_on_association(:feed_items)
    expect(f.macro).to eq(:has_many)
  end


end
