class ApplicationController < ActionController::API
  before_action :check_uri
  before_action :check_key

  require 'uri'

  def not_found
    render status: :forbidden
  end

  private

  def check_uri
    not_found unless ENV['URL_CHILLIT'].include?(URI(request.referer).host.to_s) # ip server web en credentials
  end
  
  def check_key
    not_found unless params[:key] == ENV['CHILLIT_TOKEN'] # token en credentials
  end
end
