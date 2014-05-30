Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, "75jzf6udm01ndh", "7Jcp9dpRYZGagwhC"
  # , :scope => 'r_fullprofile r_emailaddress r_network', :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "location", "connections"]
end
