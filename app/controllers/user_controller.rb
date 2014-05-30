class UserController < ApplicationController
  def index
     @user = User.find(session[:user_id])
     @user.client.connections.all.each do |connect|
      puts "L" * 50
      name = connect.name
      location = connect.location.name
      industry =  connect.industry
      img_url = @user.client.picture_urls(:id => connect.id)

      @user.connections.create(
        location: location,
        industry: industry,
        name: name,
        img_url: img_url,

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
