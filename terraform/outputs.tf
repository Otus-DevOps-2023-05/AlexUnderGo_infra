output "external_ip_address_app" {
  value = [for instance in yandex_compute_instance.app : instance.network_interface.0.nat_ip_address]
}

#Вывод адреса балансировщика
output "balancer_ip_address" {
  value = yandex_lb_network_load_balancer.app.listener.*.external_address_spec[0].*.address[0]
}

#Вывод адреса балансировщика через цикл
output "load_balancer_ip" {
  value = [
    for listener in yandex_lb_network_load_balancer.app.listener :
    listener.external_address_spec.*.address[0]
  ]
}
