class Authentication < ActiveRecord::Base
	attr_accessible :user_id, :uid, :provider, :access_token

	validates :user_id, :uid, :provider, :access_token, presence: true
	belongs_to :user
end