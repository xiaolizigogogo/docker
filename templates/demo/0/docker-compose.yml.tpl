version: '2'
services:
  sonarqube:
    labels:
      io.rancher.container.hostname_override: container_name
      io.rancher.sidekicks: sonarqube-storage
    image: sonarqube:${docker_version}
    environment:
      SONARQUBE_WEB_JVM_OPTS: ${jvm_opts}
      SONARQUBE_JDBC_USERNAME: ${postgres_user}
      SONARQUBE_JDBC_PASSWORD: ${postgres_password}
      SONARQUBE_JDBC_URL: jdbc:postgresql://db:${postgres_port}/${postgres_db}
    volumes_from:
      - sonarqube-storage
    external_links:
      - ${mysql_link}:db
	  - ${zookeeper_link}:zk
	  - ${redis_link}:redis
	  - ${kafka_link}:kafka
	  - ${mongodb_link}:mongodb
	  - ${es_link}:es
	  - ${rabbitmq_link}:rabbitmq
{{- end}}
volumes:
  demo-volume:
    driver: local