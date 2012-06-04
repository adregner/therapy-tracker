class Visit < ActiveRecord::Base
  belongs_to :client
  belongs_to :invoice
  
  def full_name
    client.contact.full_name
  end
end
