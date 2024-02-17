lighthouse
=========

Данная роль устанавливает "lighthouse" и "Nginx"


Role Variables
--------------

|vars|description|
|-----|------------|
| nginx_user | Пользователь который лт которого будет запускаться nginx |
| worker_processes | Режим работы nginx |
| worker_connections | Значение по умолчанию |
| client_max_body_size | Значение по умолчанию |
| lighthouse_vcs | Репозиторий от куда будет скачиваться Lighthouse |
| lighthouse_location_dir | Директория куда будет загружен Lighthouse |
| lighthouse_port | Значение по умолчанию |

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: lighthouse }

License
-------

MIT

Author Information
------------------

Yuriy Kukharenko