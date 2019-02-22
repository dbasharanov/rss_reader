require 'rails_helper'

RSpec.describe "feeds/edit", type: :view do
  before(:each) do
    @feed = assign(:feed, Feed.create!(
      :title => "MyString",
      :url => "https://www.investor.bg/bulletin/rss/"
    ))
  end

  it "renders the edit feed form" do
    render

    assert_select "form[action=?][method=?]", feed_path(@feed), "post" do

      assert_select "input[name=?]", "feed[title]"

      assert_select "input[name=?]", "feed[url]"
    end
  end
end