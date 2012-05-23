class Source < ActiveRecord::Base
  attr_accessible :name, :url, :type
  has_many :feeds
end
