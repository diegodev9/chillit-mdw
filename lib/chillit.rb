# require 'hubspot-api-client'

class Chillit
  def self.api_key
    Rails.application.credentials['HUBSPOT_API_KEY'] # api_key guardada en credentials
  end

  def self.client
    Hubspot::Client.new(access_token: Chillit.api_key)
  end

  def self.contacts
    # Chillit.client.crm.contacts.basic_api.get_page
  end

  def self.owners
    # Chillit.client.crm.owners.owners_api.get_page
  end

  def self.list_owners
    {
      'distribuidor': '613987710',
      'tienda': '613990997',
      'marca': '613990997',
      'trabajar': '613991089',
      'otras': '613966096'
    }
  end
end
