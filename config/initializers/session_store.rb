# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_agilepm_session',
  :secret      => '38910d132d2aaf07cdcb7bc362941346a3ac1b8101a0c89dcaaa93b40f0f13683534d14ba3852c5fe0f4365f8ed78ed2ab34e8e9b8a4d9a13798bcaf1e01ea69'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
