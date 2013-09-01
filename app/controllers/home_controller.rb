class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def get_posts
    service = current_user.services.find_by({blog_id: params[:blog_id]})
    if service && service.blog_id
      response = HTTParty.get("https://public-api.wordpress.com/rest/v1/sites/#{service.blog_id}/posts/")
      @posts = response["posts"].map { |post| Post.new(post) }
    end
  end
end
