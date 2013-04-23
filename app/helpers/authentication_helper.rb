module AuthenticationHelper

  def token?(authentications, provider)
  	current_user && authentications.send(provider).present?
  end
end