require 'rails_helper'

RSpec.describe FeedItemsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/feed_items').to route_to('feed_items#index')
    end

    it 'routes to #new' do
      expect(get: '/feed_items/new').to route_to('feed_items#new')
    end

    it 'routes to #show' do
      expect(get: '/feed_items/1').to route_to('feed_items#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/feed_items/1/edit').to route_to('feed_items#edit', id: '1')
    end


    it 'routes to #create' do
      expect(post: '/feed_items').to route_to('feed_items#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/feed_items/1').to route_to('feed_items#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/feed_items/1').to route_to('feed_items#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/feed_items/1').to route_to('feed_items#destroy', id: '1')
    end
  end
end
