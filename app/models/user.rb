class User < ActiveRecord::Base
  def self.create_person_with_omniauth(auth)
    User.create( provider: auth['provider'],
                 uid: auth['uid'],
                 name: auth['info']['name'],
                 oauth_token: auth['credentials']['token'],
                 oauth_secret: auth['credentials']['secret']
                 )
  end

  def client
    @client ||= LinkedIn::Client.new
    @client.authorize_from_access(self.oauth_token, self.oauth_secret)
    @client
  end
end
