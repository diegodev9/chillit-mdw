class ApplicationController < ActionController::API
  before_action :check_uri

  require 'uri'

  def not_found
    render status: :forbidden
  end

  private

  APPROVED_URL = %w[
    www.lab9.omatic.com.ar
    lab9.omatic.com.ar
    www.chillit.com
    chillit.com
    www.cocyar.com
    cocyar.com
  ].freeze

  def check_uri
    not_found unless APPROVED_URL.include?(URI(request.referer).host.to_s) # ip server web en credentials
  end
end
