class UserController < ApplicationController
  def index
     @user = User.find(session[:user_id])
      puts "google" * 50

    @user.client.connections.all.each do |connect|
      name = connect.first_name + " " + connect.last_name
      if connect.location
        location = connect.location.name
      end
      industry =  connect.industry
      # img_url = @user.client.picture_urls(:id => connect.id)
      img_url = connect.picture_url
    # p "hah" * 20
    # p [name, location, industry, img_url, connect.id]
    # p "raa" * 20
      @user.connections.create(
        location: location,
        industry: industry,
        name: name,
        img_url: img_url,
        connection_id: connect.id
      )

    end

# ---------------------PUT IN MODEL-----------------------------

    all_locations = []
    all_industries =[]
    @user.connections.each do |connect|
      all_locations << connect.location
      all_industries << connect.industry
    end

    @unique_locations = all_locations.uniq.compact  # RESOLVES UNIQUENESS and NIL values
    @unique_industries = all_industries.uniq.compact


  end
end
