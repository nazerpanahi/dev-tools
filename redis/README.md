# Redis

Redis in-memory data store with Docker Compose configuration and UI.

## Specifications

- **Version**: 6.2-alpine
- **Port**: 6380 (exposed on host)
- **Default Credentials**:
  - **Password**: redispassword
- **Redis UI**:
  - **Port**: 7843 (exposed on host)
  - **URL**: http://localhost:7843

## Quick Start

```bash
# Using docker-compose directly
cd redis
docker-compose up -d

# Or using the main script
./devtools.sh up redis
```

## Connect to Redis

```bash
# Connect using redis-cli
redis-cli -h localhost -p 6380 -a redispassword

# Or use the Redis UI at http://localhost:7843
```

## Data Persistence

Data is persisted in a Docker volume named `redis-cache`. This ensures your data is not lost when the container is stopped or removed.

## References
- [redis-dockerhub](https://hub.docker.com/_/redis)
