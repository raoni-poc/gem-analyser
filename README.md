Levantando o servidor no endereço http://0.0.0.0:3000/
```
docker run --rm -i -v "$PWD":/usr/src/app -w /usr/src/app -p 3000:3000 ruby:3.1.2 bash -c "bundle install && bundle exec rails s -p 3000 -b '0.0.0.0'"
```

Postgres com o Docker

```
docker volume create --name gem_analyser
docker run --name gem_analyser -v gem_analyser:$(pwd)/.docker/postgresql/data -e POSTGRES_PASSWORD=123456 -p 5432:5432 -d postgres
```

configurando as variáveis de ambiente

```
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=123456
export POSTGRES_HOST=localhost
export TEST_ENV_NUMBER=1
```

Se a porta 5432 estiver ocupada você pode configurar o container para rodar em outra porta ou simplesmente
desativar o serviço local de postgres, os comandos abaixo podem te ajudar.

stop service:
```
systemctl stop postgresql
```
start service:
```
systemctl start postgresql
```
show status of service:
```
systemctl status postgresql
```
disable service(not auto-start any more)
```
systemctl disable postgresql
```
enable service postgresql(auto-start)
```
systemctl enable postgresql
```