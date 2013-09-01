Wlog::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "home#index"
  get "/:blog_id/posts" => "home#get_posts", as: "posts"
end
