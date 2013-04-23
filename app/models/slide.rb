class Slide < ActiveRecord::Base
	attr_accessible :user_id, :name, :description

	validates :user_id, :name, :description, presence: true
	belongs_to :user
end