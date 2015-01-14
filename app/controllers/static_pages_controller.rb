class StaticPagesController < ApplicationController
  
  before_action :logged_in_user

  def home
    if logged_in?
      @micropost = current_user.microposts.build 
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  
  def feed
    @micropost = current_user.microposts.build 
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
  
  def parts
  end
  
  def stats
  end
end
