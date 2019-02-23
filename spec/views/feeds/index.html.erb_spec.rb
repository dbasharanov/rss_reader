require 'rails_helper'

RSpec.describe 'feeds/index', type: :view do
  it 'displays all feeds correctly' do
    assign(:feed, Feed.new(title: 'Reuters: Sports News', url: 'http://feeds.reuters.com/reuters/sportsNews'))
    assign(:feed_items, Kaminari.paginate_array([FeedItem.create(title: 'Shirt', link: 'http://feeds.reuters.com/reuters/sportsNews', pub_date: Time.now - 2.hours, id: '222')]).page(params[:page]).per(10))

    render

    rendered.should have_selector('input')
    rendered.should have_selector('a.delete-item')
    rendered.should have_selector('ul li:first-child a', text: 'Shirt')
    rendered.should have_selector('ul li:first-child span', text: '2 hours')
  end
end
