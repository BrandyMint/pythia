# -*- coding: utf-8 -*-

class Company < ActiveRecord::Base
  establish_connection "icfdedb_test"
  has_many :company_mentions
  # attr_accessible :name, :sector_id, :created_at, :updated_at, :securities_count, :contacts_text, :detail_text, :preview_text, :services_text, :logo_id, :minilogo_id, :book_closure_at, :annual_general_meeting_at, :reporting_date, :logo, :slug, :can_ask, :is_logo_horizontal, :is_emitent, :questions_count, :button_name, :sponsor_logo, :sponsor_logo_alt, :sponsor_url, :sponsor_link_title, :avatar, :menu_position, :indicators_count, :money_precision, :full_name, :name_en, :full_name_en, :employees_count, :address, :phone, :email, :website_url, :ceo_name, :head_bod_name, :stockholders_desc, :financial_report_url, :description

end
