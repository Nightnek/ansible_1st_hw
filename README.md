# Домашнее задание к занятию 3 «Использование Ansible»

## Подготовка к выполнению

1. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.
2. Репозиторий LightHouse находится [по ссылке](https://github.com/VKCOM/lighthouse).

## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.

![image](https://github.com/user-attachments/assets/20ef4b34-609d-4007-b8b8-8625891aab74)

2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.
3. Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер.

![image](https://github.com/user-attachments/assets/3d3ab8a3-82d5-412e-a19f-227edf61ccb8)

4. Подготовьте свой inventory-файл `prod.yml`.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.


# Описание:

В [site.yml](https://github.com/Nightnek/ansible_1st_hw/blob/master/playbook/site.yml) сделаны 3 PLAY: `clickhouse`, для `vector` и для `lighthouse`.
Каждый Play содержит в себе task'и по установке `Clickhouse`, `Vector` и `Lighthouse` соответственно.
PLAY для `lighthouse` имеет тэг `tags=lighthouse`, устанавливающий и настраивающий lighthouse.
Плейбук использует 4 файла с переменными: 3 файла для каждой из групп хостов индивидуально:

[clickhouse\vars.yml](https://github.com/Nightnek/ansible_1st_hw/blob/master/playbook/group_vars/clickhouse/vars.yml)

[vector_vars.yml](https://github.com/Nightnek/ansible_1st_hw/blob/master/playbook/group_vars/vector/vector_vars.yml)

[lighthouse_vars.yml](https://github.com/Nightnek/ansible_1st_hw/blob/master/playbook/group_vars/lighthouse/lighthouse_vars.yml)

и один файл, применяемый для всез групп хостов:

[all_vars.yml](https://github.com/Nightnek/ansible_1st_hw/blob/master/playbook/group_vars/all/all_vars.yml)

Для конфигурации Vector и Nginx используются шаблоны конфигов:

[vector.yaml.j2](https://github.com/Nightnek/ansible_1st_hw/blob/master/playbook/templates/vector/vector.yaml.j2)

[lighthouse.conf.j2](https://github.com/Nightnek/ansible_1st_hw/blob/master/playbook/templates/nginx/lighthouse.conf.j2)

![image](https://github.com/user-attachments/assets/0b4cd4d6-1808-4dea-b58a-107f8113e139)
![image](https://github.com/user-attachments/assets/18160a5c-5760-4683-8d5d-d47e3246890f)
![image](https://github.com/user-attachments/assets/6484c50f-07df-4be9-8606-ce4f43260162)
![image](https://github.com/user-attachments/assets/6e5f0a68-fa7e-435e-abdd-f4b48995b909)


