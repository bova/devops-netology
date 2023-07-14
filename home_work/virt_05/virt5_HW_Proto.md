# Домашнее задание к занятию 5. «Оркестрация кластером Docker контейнеров на примере Docker Swarm»


## Задача 2

Создайте ваш первый Docker Swarm-кластер в Яндекс Облаке.

Чтобы получить зачёт, предоставьте скриншот из терминала (консоли) с выводом команды:

docker node ls


DOC: https://cloud.yandex.ru/docs/tutorials/infrastructure-management/packer-quickstart

apt-get install packer

yc config list
yc vpc subnet list

packer plugins install github.com/hashicorp/yandex
packer validate centos-7-base.json
packer build ubuntu.json