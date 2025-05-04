# ClickHouse

ClickHouse analytical database with ClickHouse Keeper.

## Specifications

- **ClickHouse Server**:
  - **Version**: 22.8.21
  - **HTTP Port**: 58123 (exposed on host)
  - **Native Port**: 59000 (exposed on host)
  - **Web UI**: http://localhost:58123/play
- **ClickHouse Keeper**:
  - **Version**: 22.8.21
  - **Port**: 59181 (exposed on host)

## Quick Start

```bash
# Using docker-compose directly
cd clickhouse
docker-compose up -d

# Or using the main script
./devtools.sh up clickhouse
```

## Connect to ClickHouse

```bash
# Using clickhouse-client
clickhouse-client --host localhost --port 59000

# Using HTTP interface
curl http://localhost:58123/

# Or access the Web UI at http://localhost:58123/play
```

## Running SQL Queries

```sql
-- Create a sample table
CREATE TABLE example (
    id UInt32,
    name String,
    value Float64
) ENGINE = MergeTree()
ORDER BY id;

-- Insert data
INSERT INTO example VALUES (1, 'Test', 123.45);

-- Query data
SELECT * FROM example;
```

## Data Persistence

Data and configuration are persisted in Docker volumes. This ensures your data is not lost when the containers are stopped or removed.

## References
- [Minimal ClickHouse with Keeper](https://github.com/ClickHouse/examples/blob/main/docker-compose-recipes/recipes/ch-1S_1K/docker-compose.yaml)
- [ClickHouse Docker Examples](https://github.com/ClickHouse/examples/blob/main/docker-compose-recipes/README.md)
- [ClickHouse Documentation](https://clickhouse.com/docs/)
