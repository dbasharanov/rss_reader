require 'rails_helper'

RSpec.describe 'feeds/new', type: :view do
  it 'add new feed correctly' do
    assign(:feed, Feed.new(url: 'http://feeds.reuters.com/reuters/sportsNews'))
    
    render

    rendered.should have_selector('input#feed_url', text: '')
    #rendered.should have_selector('table#product_#{@product.id} tbody tr:nth-of-type(1) td:nth-of-type(2)', text: '50.0')
  end
end
