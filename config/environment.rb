# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Faceility::Application.initialize!

# LinkedIn API access

LinkedIn.configure do |config|
  config.token = "75jzf6udm01ndh"
  config.secret = "7Jcp9dpRYZGagwhC"
end


