class SessionsController < ApplicationController
  def index
  end

  def create
    auth_hash = request.env['omniauth.auth']
    p auth_hash.inspect
    p "*" * 50
    p auth_hash.keys
    p "-" * 50
    p auth_hash['credentials'].inspect
    p "+" * 50
    p auth_hash['info'].inspect
    p "/" * 50
    p auth_hash['extra'].inspect
    user = User.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid']) || User.create_person_with_omniauth(auth_hash)
    session[:user_id] = user.id

    p user.client.class
    redirect_to user_index_path


  end

  def destroy

  end
end
