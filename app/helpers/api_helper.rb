module ApiHelper do 

	def graph
    @graph = Koala::Facebook::API.new(session['access_token_facebook'])
	end

	def fb_images
    graph.get_connections("me", "albums").map do |album|
    if album['cover_photo']
      [ album["id"],
        album["name"],
       album["link"],
       graph.get_picture(album['cover_photo'])]
    end
  end
end