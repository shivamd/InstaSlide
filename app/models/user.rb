class User < ActiveRecord::Base
	attr_accessible :name 

	validates :name, presence: true
	has_many :authentications
	has_many :slides
end