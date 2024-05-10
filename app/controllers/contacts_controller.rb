class ContactsController < ApplicationController
  before_action :check_key
  before_action :check_uri

  require 'uri'
  require 'hubspot-api-client'

  def create
    owner_id = find_owner(params[:reason])

    properties_ = {
      "email": params[:email],
      "phone": params[:phone],
      "country": params[:country],
      "city": params[:city],
      "firstname": params[:name],
      "lastname": "",
      "message": params[:message],
      "hubspot_owner_id": owner_id.to_s
    }


    body_ = { properties: properties_, associations: [] }
    api_response = Chillit.client.crm.contacts.basic_api.create(body: body_)
    puts api_response

    render status: :created
  end

  private

  def check_key
    not_found unless params[:key] == ENV['CHILLIT_TOKEN'] # token en credentials
  end

  def check_uri
    not_found unless ENV['CHILLIT_URL'].include?(URI(request.referer).host.to_s) # ip server web en credentials
  end

  def find_owner(reason)
    reasons = %w[distribuidor tienda marca trabajar otras]
    find_reason = reasons.find { |reas| reas if reason.include?(reas) }

    Chillit.list_owners.find { |k, v| v if k == find_reason.to_sym }[1]
  end
end

