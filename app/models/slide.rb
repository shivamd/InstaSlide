class Slide < ActiveRecord::Base
	attr_accessible :user_id, :name, :description

	validates :user_id, :name, :description, presence: true
	belongs_to :user
	has_many :photos

	def add_photos(photos, user_id)
		photos.each do |photo|
			self.photos.create(url: photo, user_id: user_id)
		end
	end
end
