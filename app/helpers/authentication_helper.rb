module AuthenticationHelper

  def instagram_token?
  	current_user && current_user.instagram.present?
  end

  def facebook_token?
  	current_user && current_user.facebook.present?
  end

  def flickr_token?
  	current_user && current_user.flickr.present?
  end
end
