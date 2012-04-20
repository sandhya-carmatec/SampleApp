class Location < ActiveRecord::Base
  acts_as_gmappable :check_process => false
  def gmaps4rails_address
"#{self.street}, #{self.city}, #{self.country}"
  end
  def gmaps4rails_infowindow
     "<h4>#{name}</h4>" << "<h4>#{street}</h4>" << "<h4>#{city}</h4>" << "<h4>#{country}</h4>"
  end
end
