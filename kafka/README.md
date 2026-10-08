# Kafka

Apache Kafka message broker running in KRaft mode (no ZooKeeper) with AKHQ web UI.

## Specifications

- **Kafka**:
  - **Version**: 8.0.0 (Confluent)
  - **Mode**: KRaft — a single node acting as both broker and controller
  - **Port**: 29092 (exposed on host), 9092 (internal, for other containers)
  - **Controller Port**: 9093 (internal only)
  - **Number of Partitions**: 12 (default)
  - **Compression**: gzip
  - **Authorizer**: `StandardAuthorizer` (KRaft replacement for `AclAuthorizer`); everyone is allowed if no ACL is found
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

## KRaft Mode

ZooKeeper has been deprecated (and removed in Kafka 4.0 / Confluent Platform 8.0), so this setup uses KRaft (Kafka Raft) for metadata management. The single `kafka` container runs with `KAFKA_PROCESS_ROLES=broker,controller`, so no separate ZooKeeper service is needed.

The cluster ID can be overridden with the `KAFKA_CLUSTER_ID` environment variable. It must stay the same across restarts for an existing data volume; if you change it, remove the volume first.

AKHQ waits for Kafka to pass its health check before starting.

## Data Persistence

Data is persisted in the `kafka-kraft-data` Docker volume. This ensures your data is not lost when the containers are stopped or removed.

### Migrating from the ZooKeeper setup

The old `zookeeper-data`, `zookeeper-log`, and `kafka-data` volumes are no longer used and data in them is not migrated. To clean them up:

```bash
docker volume ls | grep -E 'zookeeper-(data|log)|kafka-data'
docker volume rm <volume-name>
```

## References
- [AKHQ Documentation](https://akhq.io/docs/)
- [Offset Explorer (formerly Kafka Tool)](https://www.kafkatool.com/download.html)
- [KRaft Overview (Confluent)](https://docs.confluent.io/platform/current/kafka-metadata/kraft.html)
- [Confluent Kafka Docker Documentation](https://docs.confluent.io/platform/current/installation/docker/index.html)
