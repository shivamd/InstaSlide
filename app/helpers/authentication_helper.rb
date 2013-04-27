module AuthenticationHelper

  def instagram_token?
  	signed_in? && current_user.instagram.present?
  end

  def facebook_token?
  	signed_in? && current_user.facebook.present?
  end

  def flickr_token?
  	signed_in? && current_user.flickr.present?
  end
end
