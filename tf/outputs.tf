output "control_plane_external_ip" {
  value = yandex_compute_instance.control_plane.network_interface[0].nat_ip_address
}

output "worker_external_ips" {
  value = yandex_compute_instance.worker[*].network_interface[0].nat_ip_address
}
