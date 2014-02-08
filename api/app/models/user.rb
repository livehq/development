class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:oauthio]

  acts_as_user roles: [:admin, :user]

  has_many :identities

  def self.create_for_oauthio_oauth(auth, identity)
    user = User.create(
        #name: info['name'],
        #name: auth.extra.raw_info.name,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20],
        identities: [identity],
        roles: [:user]
    )
    user
  end

end
