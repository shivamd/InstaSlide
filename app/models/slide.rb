class Slide < ActiveRecord::Base
	attr_accessible :user_id, :name, :description, :photos_attributes

	validates :user_id, :name, :description, presence: true
	belongs_to :user
	has_many :photos
	accepts_nested_attributes_for :photos
end