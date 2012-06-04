class Invoice < ActiveRecord::Base
  belongs_to :company
  has_many :visits
end
