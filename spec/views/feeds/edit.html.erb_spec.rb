require 'rails_helper'

RSpec.describe "feeds/edit", type: :view do
  it 'displays feed update form' do
    assign(:feed, Feed.create(title: 'Sports News', url: "http://feeds.reuters.com/reuters/sportsNews", id: 5))

    render

    rendered.should have_selector("input#feed_title")
  end
end
