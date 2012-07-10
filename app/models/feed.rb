# coding: utf-8
require 'open-uri'

class Feed < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :url, :presence => true, :uniqueness => true, :url => true
  attr_accessible :name, :url
  belongs_to :source
  has_many :articles
end
