class User < ActiveRecord::Base
before_save { self.email = email.downcase }
before_create :create_remember_token    # rails runs this before saving the user
validates :first_name, presence: true, length: { maximum: 50 }
validates :middle_initial, length: { maximum: 1 }
#make sure valid email is created
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence:   true,
          format:     { with: VALID_EMAIL_REGEX },
          uniqueness: { case_sensitive: false }

validates :password, length: { minimum: 6}

  has_secure_password   #Authenticates password
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
# Create a hashed password
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
