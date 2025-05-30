#!/bin/bash
set -e

DB_NAME=${DB_NAME:-"test_odoo"}
DB_USER=${DB_USER:-"odoo"}
DB_PASSWORD=${DB_PASSWORD:-"Y8kz3wQp1vLr9sT2"}

echo "Creating database '$DB_NAME' with user '$DB_USER'..."

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname postgres <<-EOSQL
    DO
    \$do\$
    BEGIN
        IF NOT EXISTS (SELECT FROM pg_database WHERE datname = '$DB_NAME') THEN
            CREATE DATABASE "$DB_NAME";
        END IF;
    END
    \$do\$;

    DO
    \$do\$
    BEGIN
        IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = '$DB_USER') THEN
            CREATE USER "$DB_USER" WITH PASSWORD '$DB_PASSWORD';
        END IF;
    END
    \$do\$;

    GRANT ALL PRIVILEGES ON DATABASE "$DB_NAME" TO "$DB_USER";
EOSQL

echo "✅ Database '$DB_NAME' created successfully (or already existed)."
