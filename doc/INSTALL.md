Как установить pythia
=====================

> git, rvm, rails, postresql

`git clone  `

`cd pythia`

`rvm install bundler`

`bundle`

вылетело с ошибкой на pg? 

Тогда:
`apt-get install postsql-dev-X.X`
`gem install pg -- --with-pg-config='/usr/bin/pg_config'`


* rake db:create
* rake db:migrate
* rake db:seed

Далее обновить компании (в консоли `rails c`)
  
  `Company.update_companies`

Запустить foreverb (cron для руби):
  `./script/foreverb-cron`