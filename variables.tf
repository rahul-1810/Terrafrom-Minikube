variable "wp_image" {
    default = "wordpress:5.1.1-php7.3-apache"
}

variable  "wp_name" {
    default = "mywp-1"
}

variable "mysql_image"{
    default = "mysql:5.7"
}

variable "mysql_name" {
    default = "mydb-1"
}

variable "root_pass" {
    default = "admin123"
}

variable "database_name" {
    default = "mydb"
}

variable "user_name"{
    default = "test_user"
}

variable "user_password" {
    default = "test123"
}

variable "service_type" {
    default = "NodePort"
}