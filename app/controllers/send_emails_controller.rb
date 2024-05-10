class SendEmailsController < ApplicationController
  before_action :check_key

  def create
    SendEmailsMailer.email(params[:email]).deliver_now
    render json: { message: 'recibido' }, status: :ok
  end

  private

  def check_key
    not_found unless params[:key] == ENV['COCYAR_TOKEN'] # token en credentials
  end
end
