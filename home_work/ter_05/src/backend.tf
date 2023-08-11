terraform {
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "vp-tfstate-dev"
    region                      = "ru-central1"
    key                         = "terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
    dynamodb_endpoint           = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gnslc43g45sjmstjav/etn9cd0o02emqa2vuf9t"
    dynamodb_table              = "tfstate-develop"
  }
}