class Photo < ActiveRecord::Base
	attr_accessible :user_id, :slide_id, :url

	validates :user_id, :slide_id, :url, presence: true
	belongs_to :user
	belongs_to :slide
end