class SessionsController < ApplicationController
  def index
  end

  def create
    auth_hash = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid']) || User.create_person_with_omniauth(auth_hash)
    session[:user_id] = user.id

    redirect_to user_index_path
  end

  def destroy

  end
end
