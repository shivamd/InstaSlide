class Slide < ActiveRecord::Base
	attr_accessible :user_id, :name, :description, :secure_url

	validates :user_id, :name, :description, presence: true
	belongs_to :user
	has_many :photos

	after_create :generate_url

	def add_photos(photos, user_id)
		photos.each do |photo|
			self.photos.create(url: photo, user_id: user_id)
		end
	end

	private

	def generate_url
		self.secure_url = SecureRandom.urlsafe_base64
		self.save!
	end
end
