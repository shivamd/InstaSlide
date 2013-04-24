class User < ActiveRecord::Base
	attr_accessible :name

	validates :name, presence: true
	has_many :authentications
	has_many :slides
	has_many :photos, through: :slides

	delegate :facebook, :instagram, :flickr, to: :authentications

	def facebook_token
		facebook.first.access_token
	end

	def instagram_token
		instagram.first.access_token
	end

	def flickr_token
		flickr.first.access_token
	end

end
