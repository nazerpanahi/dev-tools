# Elasticsearch & Kibana

Elasticsearch search engine and Kibana dashboard with Docker Compose configuration.

## Specifications

- **Elasticsearch**:
  - **Version**: 8.1.2
  - **HTTP Port**: 9200 (exposed on host)
  - **Transport Port**: 9300 (exposed on host)
  - **Security**: Disabled by default
- **Kibana**:
  - **Version**: 8.1.2
  - **Port**: 5601 (exposed on host)
  - **URL**: http://localhost:5601

## Quick Start

```bash
# Using docker-compose directly
cd elasticsearch
docker-compose up -d

# Or using the main script
./devtools.sh up elasticsearch
```

## Connect to Elasticsearch

```bash
# Test Elasticsearch with curl
curl http://localhost:9200

# Or access Kibana at http://localhost:5601
```

## Data Persistence

Data is persisted in Docker volumes named `es01-data` for Elasticsearch and `kibanadata` for Kibana. This ensures your data is not lost when the containers are stopped or removed.

## References
- [Install Elasticsearch on Docker](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html)
- [Kibana Docker Documentation](https://www.elastic.co/guide/en/kibana/current/docker.html)
