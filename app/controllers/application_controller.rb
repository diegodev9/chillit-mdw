class ApplicationController < ActionController::API
  before_action :check_uri
  before_action :check_key

  def not_found
    response.status = 404
    raise ArgumentError.new, 'Not allowed'
  end

  private

  def check_uri
    response.status = 404
    raise ArgumentError.new, 'Invalid request from external domain' if URI(request.referer).host.to_s != Rails.application.credentials.url_chillit[:ip] # ip server web en credentials
  end
  
  def check_key
    render not_found unless params[:key] == Rails.application.credentials.chillit_token[:token] # token en credentials
  end
end
