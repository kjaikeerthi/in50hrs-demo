class Users::OmniauthCallbacksController < ApplicationController
  def facebook
    auth = request.env["omniauth.auth"]
    if User.add_facebook_service(auth, current_user)
      user = User.find_by(email: auth.info.email)
      sign_in(user) if user && !user_signed_in?
    end
    redirect_to root_path
  end

  def twitter
    auth = request.env["omniauth.auth"]
    binding.pry
    # if User.add_facebook_service(auth, current_user)
    #   user = User.find_by(email: auth.info.email)
    #   sign_in(user) if user && !user_signed_in?
    # end
    redirect_to root_path
  end
end
