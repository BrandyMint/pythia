class Feed < ActiveRecord::Base
  attr_accessible :name, :url
  belongs_to :source
end
