Как установить pythia
=====================

Нужно иметь:
> git, rvm, rails, postresql

* Устанавливаем git

`sudo apt-get install git`

* (RVM) [http://rvm.io]

* Выкачиваем с гитхаба проект

`git clone ... `

`cd pythia`

`rvm install bundler`

`bundle`

Устанавливаем postreqsl

`apt-get install postsql-X.X`D
`apt-get install postsql-dev-X.X`
`gem install pg -- --with-pg-config='/usr/bin/pg_config'`