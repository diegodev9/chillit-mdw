class ApplicationController < ActionController::API
  before_action :check_uri

  require 'uri'

  def not_found
    render status: :forbidden
  end

  private

  def check_uri
    not_found unless ENV['CHILLIT_URL'].include?(URI(request.referer).host.to_s) # ip server web en credentials
    not_found unless ENV['COCYAR_URL'].include?(URI(request.referer).host.to_s) # ip server web en credentials
  end
end
