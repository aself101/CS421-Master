module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token    # create a new token
    cookies.permanent[:remember_token] = remember_token # place raw token in browser cookies
    user.update_attribute(:remember_token, User.digest(remember_token)) # save hashed token to database
    self.current_user = user
  end
end
