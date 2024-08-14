output "instance_public_ip" {
  value = aws_instance.ecommerce.public_ip
}

output "instance_id" {
  value = aws_instance.ecommerce.id
}

output "key_pair_name" {
  value = aws_key_pair.deployer_key.key_name
}

output "key_pair_fingerprint" {
  value     = tls_private_key.ecommerce.private_key_pem
}
