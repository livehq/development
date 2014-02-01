class Identity < ActiveRecord::Base
  belongs_to :user

  #def self.find_o

  def self.find_or_create_with_omniauth(auth)
    @identitiy = find_with_omniauth(auth)
    if @identitiy.nil?
      @identitiy = create_with_omniauth(auth)
    end

    @identitiy
  end

  def self.find_with_omniauth(auth)
    find_by provider: auth['provider'], uid: auth['uid']
  end

  def self.create_with_omniauth(auth)
    access_token = auth.credentials.token
    create(uid: auth['uid'], provider: auth['provider'], access_token: access_token)
  end
end
