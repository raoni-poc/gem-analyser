```
docker volume create --name gem_analyser
docker run --name gem_analyser -v gem_analyser:$(pwd)/.docker/postgresql/data -e POSTGRES_PASSWORD=123456 -p 5432:5432 -d postgres
```

configurando as variaveis de ambiente

```
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=123456
export POSTGRES_HOST=localhost
export TEST_ENV_NUMBER=1
```

Se a porta 5432 estiver ocupada você pode desativar o servico local de postgres 

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