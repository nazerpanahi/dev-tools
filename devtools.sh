#!/bin/bash

# Colors for better output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Available services
SERVICES=("postgres" "redis" "mongodb" "elasticsearch" "kafka" "clickhouse" "n8n")

# Check Docker Compose format
check_docker_compose() {
    if command -v docker-compose &> /dev/null; then
        echo "sudo docker-compose"
    else
        echo "sudo docker compose"
    fi
}

DOCKER_COMPOSE_CMD=$(check_docker_compose)

# Help function
show_help() {
    echo -e "${BLUE}Dev Tools Management Script${NC}"
    echo
    echo "Usage: ./devtools.sh [command] [service]"
    echo
    echo "Commands:"
    echo "  up [service]       Start a service or all services"
    echo "  down [service]     Stop a service or all services"
    echo "  status             Show status of all services"
    echo "  list               List all available services"
    echo "  help               Show this help message"
    echo
    echo "Services:"
    for service in "${SERVICES[@]}"; do
        echo "  - $service"
    done
    echo
    echo "Examples:"
    echo "  ./devtools.sh up postgres     # Start PostgreSQL"
    echo "  ./devtools.sh down            # Stop all services"
    echo "  ./devtools.sh status          # Check status of all services"
}

# Check if service is valid
is_valid_service() {
    local service=$1
    for s in "${SERVICES[@]}"; do
        if [ "$s" == "$service" ]; then
            return 0
        fi
    done
    return 1
}

# Get the correct docker-compose file name (.yaml or .yml)
get_docker_compose_file() {
    local service_dir=$1
    if [ -f "${service_dir}/docker-compose.yaml" ]; then
        echo "docker-compose.yaml"
    elif [ -f "${service_dir}/docker-compose.yml" ]; then
        echo "docker-compose.yml"
    else
        echo "docker-compose.yaml"  # default fallback
    fi
}

# Start service(s)
start_service() {
    local service=$1
    
    if [ -z "$service" ]; then
        echo -e "${YELLOW}Starting all services...${NC}"
        for s in "${SERVICES[@]}"; do
            echo -e "${BLUE}Starting $s...${NC}"
            local compose_file=$(get_docker_compose_file "$s")
            (cd "$s" && $DOCKER_COMPOSE_CMD -f $compose_file up -d)
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}$s started successfully!${NC}"
            else
                echo -e "${RED}Failed to start $s!${NC}"
            fi
        done
    else
        if is_valid_service "$service"; then
            echo -e "${BLUE}Starting $service...${NC}"
            local compose_file=$(get_docker_compose_file "$service")
            (cd "$service" && $DOCKER_COMPOSE_CMD -f $compose_file up -d)
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}$service started successfully!${NC}"
            else
                echo -e "${RED}Failed to start $service!${NC}"
            fi
        else
            echo -e "${RED}Invalid service: $service${NC}"
            echo "Available services:"
            for s in "${SERVICES[@]}"; do
                echo "  - $s"
            done
            exit 1
        fi
    fi
}

# Stop service(s)
stop_service() {
    local service=$1
    
    if [ -z "$service" ]; then
        echo -e "${YELLOW}Stopping all services...${NC}"
        for s in "${SERVICES[@]}"; do
            echo -e "${BLUE}Stopping $s...${NC}"
            local compose_file=$(get_docker_compose_file "$s")
            (cd "$s" && $DOCKER_COMPOSE_CMD -f $compose_file down)
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}$s stopped successfully!${NC}"
            else
                echo -e "${RED}Failed to stop $s!${NC}"
            fi
        done
    else
        if is_valid_service "$service"; then
            echo -e "${BLUE}Stopping $service...${NC}"
            local compose_file=$(get_docker_compose_file "$service")
            (cd "$service" && $DOCKER_COMPOSE_CMD -f $compose_file down)
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}$service stopped successfully!${NC}"
            else
                echo -e "${RED}Failed to stop $service!${NC}"
            fi
        else
            echo -e "${RED}Invalid service: $service${NC}"
            echo "Available services:"
            for s in "${SERVICES[@]}"; do
                echo "  - $s"
            done
            exit 1
        fi
    fi
}

# Check status of all services
check_status() {
    echo -e "${BLUE}Checking status of all services:${NC}"
    echo -e "${YELLOW}-------------------------------${NC}"
    
    sudo docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep -E "$(echo ${SERVICES[@]} | tr ' ' '|')"
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}No services are running.${NC}"
    fi
}

# Main logic
case "$1" in
    up)
        start_service "$2"
        ;;
    down)
        stop_service "$2"
        ;;
    status)
        check_status
        ;;
    list)
        echo -e "${BLUE}Available services:${NC}"
        for service in "${SERVICES[@]}"; do
            echo "  - $service"
        done
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        echo -e "${RED}Unknown command: $1${NC}"
        show_help
        exit 1
        ;;
esac

exit 0