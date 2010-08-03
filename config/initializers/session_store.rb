# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ITXMailCampaign_session',
  :secret      => '5a1b6d08baed42d2e343aa3b67c55510a63cd600990f830b9b31bca27e035750ad1ac684c9fe563538b813e95cda57a7e518eb4aaea3d0930c3f245753038b75'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
