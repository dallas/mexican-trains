# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mexican_trains_session',
  :secret      => '04c028ff3f3399dd6b41711ab76b3cf8409e5befe3ca479ec38f5199baa613568726d0b917b0c740e17627ac8be053382bc6ac73d52f6ae7be1327a3ff316a03'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
