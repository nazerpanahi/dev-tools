# Kafka

Apache Kafka message broker with Zookeeper and AKHQ web UI.

## Specifications

- **Kafka**:
  - **Version**: 7.0.2 (Confluent)
  - **Port**: 29092 (exposed on host)
  - **Number of Partitions**: 12 (default)
  - **Compression**: gzip
- **Zookeeper**:
  - **Version**: 7.0.2 (Confluent)
  - **Port**: 2181 (internal only)
- **AKHQ UI**:
  - **Version**: 0.20.0
  - **Port**: 8080 (exposed on host)
  - **URL**: http://localhost:8080

## Quick Start

```bash
# Using docker-compose directly
cd kafka
docker-compose up -d

# Or using the main script
./devtools.sh up kafka
```

## Connect to Kafka

```bash
# Using kafka-console-producer
kafka-console-producer --bootstrap-server localhost:29092 --topic my-topic

# Using kafka-console-consumer
kafka-console-consumer --bootstrap-server localhost:29092 --topic my-topic --from-beginning

# Or access AKHQ web UI at http://localhost:8080
```

## Data Persistence

Data is persisted in Docker volumes for Kafka, Zookeeper data, and Zookeeper logs. This ensures your data is not lost when the containers are stopped or removed.

## References
- [AKHQ Documentation](https://akhq.io/docs/)
- [Offset Explorer (formerly Kafka Tool)](https://www.kafkatool.com/download.html)
- [Confluent Kafka Docker Documentation](https://docs.confluent.io/platform/current/installation/docker/index.html)
