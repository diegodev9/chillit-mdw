class ApplicationController < ActionController::API
  before_action :check_uri
  before_action :check_key

  def not_found
    render status: :forbidden
  end

  private

  def check_uri
    not_found unless Rails.application.credentials.url_chillit.include?(URI(request.referer).host.to_s) # ip server web en credentials
  end
  
  def check_key
    not_found unless params[:key] == Rails.application.credentials.chillit_token # token en credentials
  end
end
