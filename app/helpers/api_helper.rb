module ApiHelper

	def graph
    @graph = Koala::Facebook::API.new(current_user.facebook_token)
  end

end
