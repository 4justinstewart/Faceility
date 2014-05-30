class UserController < ApplicationController
  def index
     @user = User.find(session[:user_id])
      puts "google" * 50
     @user.client.connections.all.each do |connect|


      name = connect.first_name + " " + connect.last_name
      location = connect.location.name
      industry =  connect.industry
      img_url = @user.client.picture_urls(:id => connect.id)
      p "hah" * 20
      p [name, location, industry, img_url.all.first, connect.id].inspect
      p "raa" * 20
      @user.connections.create(
        location: location,
        industry: industry,
        name: name,
        img_url: img_url.all.first,
        connection_id: connect.id
      )

    end

    # puts @user.client.connections.length
    # p "+" * 50
    # puts @user.client.connections.last
    # p "-" * 50

  end
end
# <% @user.client.connections.each do |connect| %>
# <ul>
#   <li>
#     <%= connect.picture_url %>
#   </li>
# </ul>
# <%end%>
