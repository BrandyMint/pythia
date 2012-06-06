class Source < ActiveRecord::Base
  validate :name, :presence => true, :uniqueness => true
  validate :url, :presence => true, :uniqueness => true, :url => true
  attr_accessible :name, :url, :type
  has_many :feeds
end
