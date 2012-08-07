# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120807122246) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "articles", :force => true do |t|
    t.string   "title",                           :null => false
    t.string   "url",                             :null => false
    t.text     "text",                            :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "feed_id",                         :null => false
    t.integer  "original_id"
    t.string   "perma_link"
    t.string   "guid"
    t.integer  "duplicates_count", :default => 0, :null => false
  end

  add_index "articles", ["created_at"], :name => "index_articles_on_created_at"
  add_index "articles", ["feed_id"], :name => "index_articles_on_feed_id"
  add_index "articles", ["original_id"], :name => "index_articles_on_original_id"
  add_index "articles", ["perma_link"], :name => "index_articles_on_perma_link"
  add_index "articles", ["text"], :name => "index_articles_on_text"
  add_index "articles", ["title"], :name => "index_articles_on_title"

  create_table "companies", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "slug",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "companies", ["name"], :name => "index_companies_on_name"
  add_index "companies", ["slug"], :name => "index_companies_on_slug"

  create_table "company_mentions", :force => true do |t|
    t.integer  "company_id", :null => false
    t.integer  "article_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_mentions", ["article_id"], :name => "index_company_mentions_on_article_id"
  add_index "company_mentions", ["company_id"], :name => "index_company_mentions_on_company_id"

  create_table "company_synonyms", :force => true do |t|
    t.integer  "company_id", :null => false
    t.string   "synonym",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "company_synonyms", ["company_id"], :name => "index_company_synonyms_on_company_id"
  add_index "company_synonyms", ["synonym"], :name => "index_company_synonyms_on_synonym"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "feeds", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "url",                           :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "source_id",      :default => 0, :null => false
    t.string   "type"
    t.integer  "articles_count", :default => 0, :null => false
  end

  add_index "feeds", ["articles_count"], :name => "index_feeds_on_articles_count"
  add_index "feeds", ["name"], :name => "index_feeds_on_name"
  add_index "feeds", ["source_id"], :name => "index_feeds_on_source_id"
  add_index "feeds", ["type"], :name => "index_feeds_on_type"
  add_index "feeds", ["url"], :name => "index_feeds_on_url", :unique => true

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type",       :null => false
  end

end
