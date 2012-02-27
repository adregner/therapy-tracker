class LineItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :visit
end
