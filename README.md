# Instruções para configuração

* Rodar o comando
rails db:drop db:create db:migrate db:seed


* Iniciar o servidor com o comando

rails s -p 3001

acessar a aplicação: http://localhost:3001


* Para as tarefas em segundo plano execute com o comando

bundle exec sidekiq


* Acessar o monitoramento das tarefas em segundo plano: http://localhost:3001/sidekiq


* Usuário e senhas já definidas se rodar os comandos iniciais

login: admin@desafio.com.br
senha: asdqwe123
