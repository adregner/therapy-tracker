class Rate < ActiveRecord::Base
  def dollars
    "$%.2f/hr" % value
  end
end
