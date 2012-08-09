ActiveAdmin.register CompanyMention do

  index do
    column :company, :sortable => :company_id do |company_mention|
      link_to company_mention.company, admin_company_path(company_mention.company)
    end
    column :article, :sortable => :article_id do |company_mention|
      link_to company_mention.article, admin_article_path(company_mention.article)
    end

    default_actions
  end

end
