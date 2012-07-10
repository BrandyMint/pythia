class Company < ActiveRecord::Base

# TODO использовать оригинальную базу

  has_many :company_mentions
  has_many :articles, :through => :company_mentions

  def self.update_companies
    companies = load_companies_from_icf_db
    update_info_about_companies companies
  end
  
private

  def self.load_companies_from_icf_db
    import_companies = CompanyIcf.all
  end


  def self.update_info_about_companies companies
    companies.each do |company|
      local_company = Company.where(:id => company.id).first
      unless local_company
        local_company = Company.new
        local_company.id = company.id
      end

      local_company.name = company.name
      local_company.slug = company.slug
      local_company.save
    end

  end

end