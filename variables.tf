variable "access_key" {
    description = "Access key to AWS console"
}

variable "secret_key" {
    description = "Secret key to AWS console"
}

variable "region" {
    description = "AWS region"
}

variable "cluster_name" {
  default = "tech-challenge-eks"
}

variable "cluster_version" {
  default = "tech-challenge-eks"
}