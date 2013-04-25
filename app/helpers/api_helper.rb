module ApiHelper

	def fb_graph
    @graph = Koala::Facebook::API.new(current_user.facebook_token)
  end

  def fb_albums_info
    fb_graph.get_connections("me", "albums").map do |album|
      Hash[[:id, :name, :link, :cover_photo].zip([ album["id"],
        album["name"],
        album["link"],
        fb_graph.get_picture(album['cover_photo'])])]
    end
  end

  def fb_photos(album_id)
  	fb_graph.get_connections(album_id, "photos")
  end

  def ig_photos
    Instagram.access_token = current_user.instagram_token
    Instagram.user_recent_media
  end
end

