class Post
  include ActiveModel::Model

  attr_accessor :author, :title, :content, :slug, :created_date, :categories, :url, :short_url

  def initialize(attributes)
    self.author = attributes["author"]
    self.title = attributes["title"]
    self.content = attributes["content"]
    self.created_date = Date.parse(attributes["date"])
    self.categories = attributes["categories"]
    self.url = attributes["url"]
    self.short_url = attributes["short_url"]
  end
end
