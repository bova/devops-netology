# Домашнее задание к занятию 4. «Оркестрация группой Docker-контейнеров на примере Docker Compose»

## Задача 1

DOC: https://cloud.yandex.ru/docs/tutorials/infrastructure-management/packer-quickstart

apt-get install packer

yc config list
yc vpc subnet list

packer plugins install github.com/hashicorp/yandex
packer validate ubuntu.json
packer build ubuntu.json


## Задача 2

Создать файлы из репозитория

https://github.com/netology-group/virt-homeworks/tree/virt-11/05-virt-04-docker-compose/src/terraform

в директории /home/bova/virt4/task2_2

network.tf 
node01.tf
output.tf
provider.tf
variables.tf

terraform init


yc iam key create --service-account-name sa1 --output key.json


terraform plan
terraform apply

## Задача 3

ansible-playbook provision.yml


## Задача 4

Grafana

http://158.160.70.121:3000/
admin/


## Задача 5

On node01

wget https://github.com/prometheus/node_exporter/releases/download/v1.6.0/node_exporter-1.6.0.linux-amd64.tar.gz
tar xvfz node_exporter-1.6.0.linux-amd64.tar.gz
cd node_exporter-1.6.0.linux-amd64
./node_exporter

-- on centos1

-job_name: 'node01 nodeexporter'
    scrape_interval: 5s
    static_configs:
    - targets: ['<Server_IP_of_Node_Exporter_Machine>:9100']
	
	
  - job_name: 'nodeexporter node01'
    scrape_interval: 5s
    static_configs:
      - targets: ['158.160.112.143:9100']
	