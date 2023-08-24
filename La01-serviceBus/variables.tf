// AppRegistration
variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

// have a uniq name available
variable "sbn_name" {
  type = string
}

variable "sbn_sku" {
  type = string
}

// queue name
variable "sbn_queue_name" {
  type = string
}

// auth queue (SAS Policy)
variable "sbn_queue_auth_rul_name" {
  type    = string
  default = "SenderPolicy"
}
