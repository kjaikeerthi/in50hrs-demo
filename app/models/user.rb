class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :services

  def add_to_service(params)
    service = Service.find_by({user_id: self.id, uid: params[:uid]})
    unless service
      services.create(params)
      return true
    end
    false
  end

  def self.add_facebook_service(auth, user)
    if user
      service = user.services.where({uid: auth.uid})
      unless service
        user.add_to_service({provider: "facebook", uid: auth.uid, auth_token: auth.credentials.token})
        return true
      end
    else
      user = User.find_by({email: auth.info.email})
      user = User.create({email: auth.info.email, password: Time.now.to_i}) unless user
      if user
        user.add_to_service({provider: "facebook", uid: auth.uid, auth_token: auth.credentials.token})
        return true
      end
    end
    false
  end
end
