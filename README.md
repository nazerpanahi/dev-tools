# Dev Tools Collection

A collection of development tools packed in Docker containers for quick setup and usage.

## Overview

This repository contains Docker Compose configurations for various development tools and databases that are frequently needed during development. Each tool is isolated in its own directory with all necessary configurations.

## Available Tools

| Tool | Version | Ports | Description |
|------|---------|-------|-------------|
| [PostgreSQL](./postgres/) | 14.1 | 5432 | Relational database |
| [Redis](./redis/) | 6.2 | 6380 | In-memory data structure store |
| [MongoDB](./mongodb/) | 5.0 | 27017, 8081 (UI) | NoSQL database with admin UI |
| [Elasticsearch](./elasticsearch/) | 8.1.2 | 9200, 9300, 5601 (Kibana) | Search and analytics engine with Kibana |
| [Kafka](./kafka/) | Latest | Various | Distributed streaming platform |
| [ClickHouse](./clickhouse/) | 22.8.21 | 58123, 59000 | Column-oriented DBMS for analytics |
| [n8n](./n8n/) | Latest | 5678 | Workflow automation tool |

## Quick Start

### Using the Helper Script

A helper script is included to easily manage all services. Make it executable:

```bash
chmod +x devtools.sh
```

The script uses `sudo` for running Docker commands, so make sure your user has proper permissions.

Start a specific tool:
```bash
./devtools.sh up postgres
```

Start all tools:
```bash
./devtools.sh up
```

Check status of running tools:
```bash
./devtools.sh status
```

Stop a specific tool:
```bash
./devtools.sh down redis
```

Stop all tools:
```bash
./devtools.sh down
```

### Manual Usage

Each tool directory contains its own `docker-compose.yaml` file. To start a tool manually:

```bash
cd <tool-directory>
docker-compose up -d
```

To stop a tool:

```bash
cd <tool-directory>
docker-compose down
```

## Configuration

Each tool directory contains:
- A `docker-compose.yaml` file for the service definition (without version field, as it's optional in newer Docker Compose versions)
- A `.env` file for configuration (copy from `.env.example` and modify as needed)
- A `README.md` with tool-specific instructions

### Default Environment Variables

For ease of use, all services have default values configured in the Docker Compose files. You can:
1. Just run the services without any configuration (defaults will be used)
2. Create a `.env` file in each service directory (use `.env.example` as a template)
3. Modify the `.env` file to customize service configuration

The following values are configured with defaults:
- Ports
- Versions
- Usernames/passwords
- Basic service settings

## Requirements

- Docker 20.10.x or later
- Docker Compose V2

## Contributing

Feel free to contribute by adding new tools or improving existing configurations.
