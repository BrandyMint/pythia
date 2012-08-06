# -*- coding: utf-8 -*-

namespace :vlad do
  set :deploy_to, "/home/wwwdata/pythia"
  set :repository, 'git@github.com:investcafe/pythia.git'
  set :unicorn_rc, "/etc/init.d/unicorn_pythia"

  set :deploy_tasks, %w[
           vlad:update
           vlad:symlink
           vlad:bundle:install
           vlad:migrate
           vlad:precompile
           vlad:unicorn:upgrade
           vlad:put_revision
           vlad:cleanup
    ]
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
