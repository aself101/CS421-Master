module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token    # create a new token
    cookies.permanent[:remember_token] = remember_token # place raw token in browser cookies
    user.update_attribute(:remember_token, User.digest(remember_token)) # save hashed token to database
    self.current_user = user
  end
  #A user is signed in if there is a current user in the session
  def signed_in?
    !current_user.nil?
  end

  # User to be signed in
  def current_user=(user)
    @current_user = user
  end
  # User is remembered
  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_out
    current_user.update_attribute(:remember_token,
                                  User.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

end

