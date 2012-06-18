# -*- coding: utf-8 -*-

class Company < ActiveRecord::Base
  establish_connection "icfdedb_test"
  has_many :company_mentions

end
