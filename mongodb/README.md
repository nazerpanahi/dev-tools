# MongoDB

MongoDB database with Docker Compose configuration and web UI.

## Specifications

- **Version**: 5.0
- **Port**: 27017 (exposed on host)
- **Default Credentials**:
  - **Username**: root
  - **Password**: 12345678
- **MongoDB Express UI**:
  - **Port**: 8081 (exposed on host)
  - **URL**: http://localhost:8081

## Quick Start

```bash
# Using docker-compose directly
cd mongodb
docker-compose up -d

# Or using the main script
./devtools.sh up mongodb
```

## Connect to MongoDB

```bash
# Connect using mongosh client
mongosh mongodb://root:12345678@localhost:27017/

# Or use the MongoDB Express UI at http://localhost:8081
```

## Data Persistence

Data is persisted in a Docker volume named `mongo-data`. This ensures your data is not lost when the container is stopped or removed.

## References
- [MongoDB Docker Hub](https://hub.docker.com/_/mongo)
- [Mongo Express](https://github.com/mongo-express/mongo-express)