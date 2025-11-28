output "clickhouse_host" {
  value = yandex_compute_instance.clickhouse.network_interface[0].nat_ip_address
}

output "vector_host" {
  value = yandex_compute_instance.vector.network_interface[0].nat_ip_address
}

output "lighthouse_host" {
  value = yandex_compute_instance.lighthouse.network_interface[0].nat_ip_address
}

