variable "SNMP_EXPORTER_VERSION" {
  default = "main"
}

group "default" {
  targets = [ "generator", "mibs" ]
}

target "generator" {
  args = {
    "SNMP_EXPORTER_VERSION" = SNMP_EXPORTER_VERSION
  }
  target = "generator"
  platforms = [ "local" ]
  output = [ "generator" ]
}

target "mibs" {
  args = {
    "SNMP_EXPORTER_VERSION" = SNMP_EXPORTER_VERSION
  }
  target = "mibs"
  platforms = [ "local" ]
  output = [ "mibs" ]
}
