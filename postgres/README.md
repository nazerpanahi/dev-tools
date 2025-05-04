# PostgreSQL

PostgreSQL database with Docker Compose configuration.

## Specifications

- **Version**: 14.1-alpine
- **Port**: 5432 (exposed on host)
- **Default Credentials**:
  - **Username**: postgres
  - **Password**: postgres

## Quick Start

```bash
# Using docker-compose directly
cd postgres
docker-compose up -d

# Or using the main script
./devtools.sh up postgres
```

## Connect to PostgreSQL

```bash
# Connect using psql client
psql -h localhost -p 5432 -U postgres

# Or using any PostgreSQL client with these parameters:
# Host: localhost
# Port: 5432
# User: postgres
# Password: postgres
# Database: postgres (default)
```

## Data Persistence

Data is persisted in a Docker volume named `db`. This ensures your data is not lost when the container is stopped or removed. 