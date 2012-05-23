class Feed < ActiveRecord::Base
  attr_accessible :name, :url
  #subscribe_id :source
end
