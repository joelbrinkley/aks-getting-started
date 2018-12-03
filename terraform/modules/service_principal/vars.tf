variable "name" {
  description = "The name of the service principal"
}

variable "expiration" {
  default = "2020-01-01T00:00:00Z"
  description = "The expiration date of the service principal password.  The value should be represented a date time represented as a string."
}

variable "role" {
  default = "Reader"
  description = "The role to assign the service principal"
}