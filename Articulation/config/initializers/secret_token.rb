# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Articulation::Application.config.secret_key_base = '93ea1a7a536275b31e564e6dd0001778ddb2c946d9e7aa2d9a9a2099e564930a9dc41ec2fad6aa7e5fd285829899d89b1b64fd2448a952fcd8cf035d4f2a5739'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Articulation::Application.config.secret_key_base = secure_token