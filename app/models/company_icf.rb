# -*- coding: utf-8 -*-
class CompanyIcf < ActiveRecord::Base
  self.table_name = 'companies'
  establish_connection "icfdedb_#{Rails.env}"
end