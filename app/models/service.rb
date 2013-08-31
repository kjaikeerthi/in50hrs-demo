class Service < ActiveRecord::Base
  belongs_to :user

  def add_service_user(user, auth)
    if user
      user.services.create({provider: :facebook, uid: auth.uid, auth_secret: auth.credentials.token})
    end
  end
end
