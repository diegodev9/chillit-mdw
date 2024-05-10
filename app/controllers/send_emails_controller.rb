class SendEmailsController < ApplicationController
  before_action :check_key
  before_action :check_uri

  require 'uri'

  def create
    SendEmailsMailer.email(params[:email]).deliver_now
    render json: { message: 'recibido' }, status: :ok
  end

  private

  def check_uri
    not_found unless ENV['COCYAR_URL'].include?(URI(request.referer).host.to_s) # ip server web en credentials
  end

  def check_key
    not_found unless params[:key] == ENV['COCYAR_TOKEN'] # token en credentials
  end
end
