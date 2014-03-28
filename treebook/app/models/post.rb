class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
					  length: { minimum: 5 }	# all posts have a title at least 5 characters long
	#[...]
end
