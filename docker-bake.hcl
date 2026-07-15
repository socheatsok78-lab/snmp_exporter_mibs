variable "SNMP_EXPORTER_VERSION" {
  default = "main"
}
target "default" {
  args = {
    "SNMP_EXPORTER_VERSION" = SNMP_EXPORTER_VERSION
  }
  platforms = [ "local" ]
  output = [ "mibs" ]
}
