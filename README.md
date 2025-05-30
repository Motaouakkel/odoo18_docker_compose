## Using Docker

This project is designed to run easily with Docker. All required services are defined in the `docker-compose.yml` file.

### Steps to Run with Docker

1. **Build and start the containers:**
    ```bash
    docker compose up -d
    ```

2. **View running services:**
    ```bash
    docker compose ps
    ```

3. **Stop the application:**
    ```bash
    docker compose down
    ```

> **Tip:** Make sure Docker is installed and running on your system before executing these commands.

For advanced usage or troubleshooting, refer to the official [Docker documentation](https://docs.docker.com/).
