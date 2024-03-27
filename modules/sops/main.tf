data "sops_file" "encrypted_file" {
  source_file = var.encrypted_file
  #input_type  = var.encrypted_type
}

resource "aws_secretsmanager_secret" "secrets" {
  name        = "${var.env}/${var.secret_name}"
  description = "Created using platform-secrets-manager and SOPS"

  recovery_window_in_days        = "0"
  force_overwrite_replica_secret = true

  tags = {
    Environment = var.env
  }
}

resource "aws_secretsmanager_secret_version" "secrets" {
  for_each      = nonsensitive(data.sops_file.encrypted_file.data)
  secret_id     = aws_secretsmanager_secret.secrets.id
  secret_string = sensitive(data.sops_file.encrypted_file.data[each.key])
}
