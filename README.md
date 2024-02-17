# ansible-homeworks-04-playbook
# NGINX, Lighthouse, Clickhouse и Vector
    Заранее было зозано два плейбука для ролей
        1. https://github.com/NeTrogajSvetchu/ansible-homeworks-04-vector-role
        2. https://github.com/NeTrogajSvetchu/ansible-homeworks-04-lighthouse-role
## Что делает плейбук

на узле lighthouse-01

1. Загружает и устаналевает "epel"
2. Устанавлевает NGINX
3. Подтягивает конфиг для NGINX
4. Загружает и устаналевает "git"
5. Копирует с гита lighthouse
6. Подтягивает конфиг для lighthouse
   
на узле Clickhouse-01

1. Устанавлевает Clickhouse client , server , common
2. Запускает сервер и создает базу данных Clickhouse
   
на узле Vector-01

1. Устанавлевает Vector
2.  Подтягивает настройки из vector.toml.j2
3.  Запускает Vector

## Запуск

Для запуска плейбука необходимо создать две машины под упроавлением centos 7+ настоить ssh подключение 
заполнить prod.yml именем машины и ip адресом затем запустить команду на хосте 
```ansible-playbook site.yml -i ./inventory/prod.yml --diff```