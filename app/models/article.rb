# coding: utf-8
class Article < ActiveRecord::Base
  validates :text, :presence => true
  validates :url, :presence => true, :url => true

  attr_accessible :title, :text, :url
  belongs_to :feed

  def search
    text.mb_chars.upcase.split(" ").each do |word|
      if search_company(word) then
        puts word
      end
    end
  end

def search_company name_company=nil
  all_names_company = []
  #...
  all_names_company.push("цена".mb_chars.upcase)
  all_names_company.index(name_company)
end

# # TODO move to lib
#   def search_word word
#     Company.find word
#     CompanySynomims.find word
#     Security.find
#   end
end
