class Company < ActiveRecord::Base
  belongs_to :contact
  has_many :invoices
end
