class Client < ActiveRecord::Base
  belongs_to :company
  belongs_to :contact
  belongs_to :agency
  belongs_to :rate
end
