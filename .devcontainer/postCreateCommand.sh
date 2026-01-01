#!/bin/bash

# Wait for PostgreSQL to be ready
echo "Waiting for PostgreSQL to start..."
until pg_isready -h localhost -p 5432 -U postgres > /dev/null 2>&1; do
  sleep 1
done

echo "PostgreSQL is ready!"

# Create database
echo "Creating database transaction_recap..."
psql -U postgres -c "CREATE DATABASE transaction_recap;" 2>/dev/null || echo "Database already exists"

# Run initialization script
echo "Setting up database schema..."
psql -U postgres -d transaction_recap -f /workspaces/transaction-recap/.devcontainer/init.sql

echo "PostgreSQL setup complete!"
echo "Connection details:"
echo "  Host: localhost"
echo "  Port: 5432"
echo "  User: postgres"
echo "  Password: postgres"
echo "  Database: transaction_recap"
echo ""
echo "To connect, run: psql -U postgres -d transaction_recap"
