provider "kubernetes" {
  config_context_cluster   = "minikube"
  config_path = "./config"
}


resource "kubernetes_pod" "wordpress-pod" {
  metadata {
    name = var.wp_name
    labels = {
        app = "wp"
    }
  }
  spec {
    container {
      image = var.wp_image
      name  = var.wp_name
    }
  }
}


resource "kubernetes_pod" "mysql-pod" {
  metadata {
    name = var.mysql_name
  }
  spec {
    container {
      image = var.mysql_image
      name  = var.mysql_name
      env{
          name = "MYSQL_ROOT_PASSWORD"
          value = var.root_pass
      }
      env {
          name = "MYSQL_DATABASE"
          value = var.database_name
      }
      env{
          name = "MYSQL_USER"
          value = var.user_name
      }
      env{
          name = "MYSQL_PASSWORD"
          value = var.user_password
      }
    }
  }
}

resource "kubernetes_service" "service"{
    metadata{
        name = "service-wordpress"
    }
    spec {
        selector = {
            app = "wp"
        }
        session_affinity = "ClientIP"
        port{
            port = 80
            target_port = 80
        }
        type = var.service_type
    }

}