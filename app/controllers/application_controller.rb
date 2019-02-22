class ApplicationController < ActionController::Base
  before_action :all_feeds_query


  def all_feeds_query
    @feeds = Feed.order(id: :desc)
  end
end
