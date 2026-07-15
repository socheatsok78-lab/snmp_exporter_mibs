variable "SNMP_EXPORTER_VERSION" {
  default = "31c91fd8325fd8e1ba9fb2338763c6b8db7447ce"
}
target "default" {
  args = {
    SNMP_EXPORTER_VERSION = SNMP_EXPORTER_VERSION
  }
  platforms = [ "local" ]
  output = [ "mibs" ]
}
