# -*- coding: utf-8 -*-

class CompanyIcf < ActiveRecord::Base
  set_table_name 'companies' 
  establish_connection "icfdedb_#{RAILS_ENV}"
end