class Contact < ActiveRecord::Base
  def full_name
    "%s %s" % [first_name, last_name]
  end
  
  def reverse_name
    "%s, %s" % [last_name, first_name]
  end
end
