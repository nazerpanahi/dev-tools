# n8n

n8n is a free and open [fair-code licensed](https://docs.n8n.io/reference/license/) workflow automation tool.

## Specifications

- **Version**: 1.90.2
- **Port**: 5678 (exposed on host)
- **URL**: http://localhost:5678
- **Authentication**: Disabled by default (can be enabled via env vars)
- **Database**: SQLite (default)

## Quick Start

```bash
# Using docker-compose directly
cd n8n
sudo docker-compose up -d

# Or using the main script (which includes sudo internally)
./devtools.sh up n8n
```

## Connect to n8n

Open your browser and navigate to http://localhost:5678. You will see the n8n interface where you can:

1. Create new workflows
2. Manage existing workflows
3. Set up credentials for various services
4. Trigger workflows manually or on schedule

## Examples of What You Can Do With n8n

- Create workflow automations connecting various services
- Set up webhooks to trigger actions based on events
- Schedule periodic tasks
- Process and transform data between services
- Build custom integrations between apps and services

## Data Persistence

Data is persisted in a Docker volume named `n8n-data`. This ensures your workflows and credentials are not lost when the container is stopped or removed.

## Security Considerations

By default, n8n is configured without authentication. For production or public-facing instances, it's recommended to:

1. Enable basic authentication by uncommenting and configuring the relevant environment variables in the .env file
2. Change the default encryption key
3. Use HTTPS when exposing the service

## References

- [n8n Official Documentation](https://docs.n8n.io/)
- [n8n GitHub Repository](https://github.com/n8n-io/n8n)
- [n8n Docker Documentation](https://docs.n8n.io/hosting/installation/docker/)