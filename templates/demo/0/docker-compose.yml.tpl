version: '2'
services:
  demo:
    labels:
      io.rancher.container.hostname_override: container_name
	  io.rancher.scheduler.affinity:host_label: ${host_label}
    image: registry.cn-beijing.aliyuncs.com/jml/demo:${docker_version}
    volumes_from:
      - demo-volume
    external_links:
      - ${mysql_link}:db
	  - ${zookeeper_link}:zk
	  - ${redis_link}:redis
	  - ${kafka_link}:kafka
	  - ${mongodb_link}:mongodb
	  - ${es_link}:es
	  - ${rabbitmq_link}:rabbitmq
volumes:
  demo-volume:
    driver: local