ActiveAdmin::Dashboards.build do
  section "Statistic:" do
    strong {link_to "Article: #{Article.count}", admin_articles_path}
    strong {link_to "Company_menton: #{CompanyMention.count}", admin_company_mentions_path}
  end

  section "Article" do
    table_for Article.order("created_at desc").limit(5) do
      column :title
      column :created_at
    end
    strong { link_to "View All Products", admin_articles_path }
  end

  section "Company mentions" do
    data = CompanyMention.get_count_articles_by_range(start_day: 1.week.ago, stop_day: Date.today)
    data.each do |day, count_article|
      div{"#{day.to_date} = #{count_article}"}
    end

  end
  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
