require 'rails_helper'

RSpec.describe "feeds/show", type: :view do
  before(:each) do
    @feed = assign(:feed, Feed.create!(
      :title => "Title",
      :url => "http://feeds.bbci.co.uk/news/world/rss.xml"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/http:\/\/feeds.bbci.co.uk\/news\/world\/rss.xml/)
  end
end
