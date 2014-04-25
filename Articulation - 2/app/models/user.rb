class User < ActiveRecord::Base
  belongs_to :login
  #validates :content, length: { maximum: 140 }
end
