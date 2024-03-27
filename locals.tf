locals {
  yaml_files = fileset("${path.module}/encrypted/dev/", "*.enc.yaml")
  yaml_map   = { for f in local.yaml_files : f => yamldecode(file("${path.module}/encrypted/dev/${f}")) }
}
