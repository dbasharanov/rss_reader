require 'rails_helper'

RSpec.describe "feeds/show", type: :view do
  describe 'feeds/show.html.erb' do
    it 'displays feed details correctly' do
      assign(:feed, Feed.create(title: 'Reuters: Sports News', url: "http://feeds.reuters.com/reuters/sportsNews"))
      assign(:feed_items, Kaminari.paginate_array([FeedItem.create(title: 'Shirt', link: "http://feeds.reuters.com/reuters/sportsNews", pub_date: '2019-02-21 09:13:14')]).page(params[:page]).per(10))

      render

      rendered.should have_selector("h1#feedTitle", text: 'Reuters: Sports News')
      #rendered.should have_selector("table#product_#{@product.id} tbody tr:nth-of-type(1) td:nth-of-type(2)", text: '50.0')
    end
  end
end
