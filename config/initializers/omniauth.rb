Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], scope: "user_photos"
  provider :instagram, ENV['INSTAGRAM_APP_ID'], ENV['INSTAGRAM_SECRET']
  provider :flickr, ENV['FLICKR_APP_ID'], ENV['FLICKR_SECRET']
end
