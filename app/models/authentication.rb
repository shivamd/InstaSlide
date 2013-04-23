class Authentication < ActiveRecord::Base
	attr_accessible :user_id, :uid, :provider, :access_token

	validates :user_id, :uid, :provider, :access_token, presence: true
	belongs_to :user

	def self.from_omniauth(auth)
		find_by_provider_and_uid(auth['provider'], auth['uid'])
	end
end