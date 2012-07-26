# -*- coding: utf-8 -*-

namespace :vlad do

  set :application, "pythia"

  if ENV['DEPLOY_TO']=='production'
    set :domain, "wwwdata@investcafe.ru"
  else
    set :domain, "wwwdata@icfdev.ru"
  end

  set :deploy_to, "/home/wwwdata/pythia"
  set :repository, 'git@github.com:investcafe/pythia.git'

  set :copy_files, [ 'config/database.yml' ]
  set :symlinks, copy_files

  set :shared_paths, {
    'log'    => 'log',
    'system' => 'public/system',
    'pids'   => 'tmp/pids',
    'bundle' => 'vendor/bundle'
  }

  # set :unicorn_command, "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec unicorn"

  desc 'Restart foreverb on icf'
  remote_task :foreverb do
    puts "Restart foreverb"
    run "cd #{current_path}; RAILS_ENV=#{rails_env} nohup bundle exec ./script/foreverb-cron 2>&1 >> /tmp/forever-restart.log &"
    #run "cd #{current_path}; echo #{current_path}; RAILS_ENV=#{rails_env} bundle exec ./script/foreverb-cron"
  end

  namespace :monit do
    desc 'stop monitoring'
    remote_task :stop do
      # sudo "monit unmonitor all >> /tmp/monit.log"
      # sudo "monit stop foreverb >> /tmp/monit.log"
    end

    desc 'start monitoring'
    remote_task :start do
      puts "Start daemons.."
      daemons = [:delayed_job, :foreverb, :mailman] # А зачем solr рестартовать?
      # sudo "monit monitor all >> /tmp/monit.log"
      daemons.each do |d|
        sudo "monit restart #{d} >> /tmp/monit.log"
      end
    end
  end

  desc 'Restart icf daemons'
  remote_task :restart_icf_daemons do
    puts "Restart daemons.."
    # Rake::Task['vlad:foreverb'].invoke
    # Rake::Task['vlad:delayed_job:restart'].invoke
  end

  desc 'Seed Courier subscriptions'
  remote_task :seed_courier do
    puts 'Seed courier subscriptions'
    run "cd #{current_path}; RAILS_ENV=#{rails_env} nohup bundle exec rake icf:seed:courier > /tmp/seed_courier.log 2>&1 &"
  end

  desc 'Load new db/templates and pages'
  remote_task :load_templates_and_pages do
    puts 'Load templates'
    return # TODO Сделать так чтобы шаблоны измененные в базе не перезаписывались
    run "cd #{current_path}; RAILS_ENV=#{rails_env} nohup bundle exec rake icf:templates:load icf:pages:load notifications:load_message_templates icf:seed:courier FORCE=true >> /tmp/load_templates_and_pages.log &"
  end

  set :unicorn_rc, "/etc/init.d/unicorn_pythia"

  if ENV['DEPLOY_TO']=='production'
    set :deploy_tasks, %w[
           vlad:describe
           vlad:git_fetch
           vlad:update
           vlad:symlink
           vlad:bundle:install
           vlad:migrate
           vlad:seed_courier
           vlad:precompile
           vlad:solr_reindex
           vlad:monit:stop
           vlad:unicorn:upgrade
           vlad:monit:start
           vlad:put_revision
           vlad:cache_clear
           vlad:cleanup
    ]
  else
    set :deploy_tasks, %w[
           vlad:git_fetch
           vlad:update
           vlad:symlink
           vlad:bundle:install
           vlad:migrate
           vlad:precompile
           vlad:unicorn:upgrade
           vlad:cleanup
    ]
  end
end


# Однажды
# rake vlad:setup
#
# Когда нужно скопировать database.yml на сервер
# rake vlad:copy
# rake vlad:symlink
#
# Руглярно
# git push
# rake vlad:deploy
