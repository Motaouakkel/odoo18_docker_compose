#!/bin/bash

set -e

# Default values if not provided
DB_NAME=${DB_NAME:-"test_odoo"}
DB_USER=${DB_USER:-"odoo"}
DB_PASSWORD=${DB_PASSWORD:-"Y8kz3wQp1vLr9sT2"}
POSTGRES_USER=${POSTGRES_USER:-"odoo"}  # must match docker-compose

echo "Creating database '$DB_NAME' with user '$DB_USER'..."

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE "$DB_NAME";
    CREATE USER "$DB_USER" WITH PASSWORD '$DB_PASSWORD';
    GRANT ALL PRIVILEGES ON DATABASE "$DB_NAME" TO "$DB_USER";
EOSQL

echo "✅ Database '$DB_NAME' created successfully."
