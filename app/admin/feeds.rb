# coding: utf-8
ActiveAdmin.register Feed do

  form do |f|
    f.inputs "Feed" do
      f.input :name
      f.input :url
      f.input :type
    end
    f.buttons
  end

  show do
    attributes_table do
      row :name
      row :type
      row :url
    end
    active_admin_comments
  end
 
  index do
    column :name
    column :type
    column :url
    column :source
  end  

end