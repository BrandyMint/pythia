# coding: utf-8
ActiveAdmin.register Feed do
 
  member_action :collect do
    feed = Feed.find params[:id]
    feed.collect_articles
    redirect_to({:action => :show}, {:notice => "Collected!"})
  end

  member_action :deactive do
    feed = Feed.find params[:id]
    feed.state = "deactive"
    feed.save
    redirect_to({:action => :show}, {notice => "Лента выключена!"})
  end

  member_action :create, :method => :post do
    source = Source.find_by_name "ManualRss"
    url = params[:feed][:url]
    Feed::Rss.create name: url, url: url, source_id:source.id
    redirect_to({:action => :index}, {:notice => "Created!"})
  end


  index do
    column :source, :sortable => false
    column :name
    column :url
    column :articles_count do |feed|
      link_to feed.articles_count, admin_articles_path(:q => {:feed_id_eq => feed.id })
    end

    default_actions
  end
  
  action_item :only => :show do
    link_to 'Собрать статьи', collect_admin_feed_path(feed)
  end

  action_item :only => :show do
    link_to 'Выключить ленту', deactive_admin_feed_path(feed)
  end

  form do |f|
    f.inputs do
    f.input :url
  end

    f.buttons
  end
end


