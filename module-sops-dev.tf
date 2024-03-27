module "sops_dev" {
  source = "./modules/sops"
  env    = "dev"

  for_each       = local.yaml_map
  secret_name    = trimsuffix("${each.key}", ".enc.yaml")
  secret_string  = each.value.data
  encrypted_file = "${path.module}/encrypted/dev/${each.key}"
}
