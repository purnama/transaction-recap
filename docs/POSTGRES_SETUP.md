# PostgreSQL Setup Guide

## What This Is

PostgreSQL is already running in your Codespace. This guide shows you how to use it to query transaction data with SQL.

---

## Quick Start

### 1. Open Terminal

In VS Code Codespaces:
- Press `` Ctrl + ` `` (backtick) to open terminal
- Or click **Terminal** → **New Terminal**

### 2. Connect to PostgreSQL

```bash
psql -U postgres -d transaction_recap
```

You should see:
```
psql (16.x)
Type "help" for help.

transaction_recap=#
```

You're now connected to PostgreSQL.

---

## Load Transaction Data

### Check if Table Exists

```sql
\dt
```

You should see the `transactions` table.

### View Table Structure

```sql
\d transactions
```

This shows all columns and their types.

### Load CSV Data

```sql
\copy transactions FROM '/workspaces/transaction-recap/data/transactions.csv' WITH (FORMAT csv, HEADER true);
```

You should see: `COPY 206` (or similar, depending on number of rows).

### Verify Data Loaded

```sql
SELECT COUNT(*) FROM transactions;
```

```sql
SELECT * FROM transactions LIMIT 5;
```

---

## Basic Queries

### See All Transaction Types

```sql
SELECT DISTINCT transaction_type 
FROM transactions 
ORDER BY transaction_type;
```

### Count Transactions by User

```sql
SELECT 
    user_id, 
    COUNT(*) as total_transactions,
    SUM(amount) as total_amount
FROM transactions
GROUP BY user_id
ORDER BY user_id;
```

### Find All Transactions for One User

```sql
SELECT 
    timestamp, 
    transaction_type, 
    amount, 
    merchant_name, 
    bill_type
FROM transactions
WHERE user_id = 'user_001'
ORDER BY timestamp;
```

### Filter by Transaction Type

```sql
SELECT 
    user_id,
    timestamp,
    amount,
    merchant_name
FROM transactions
WHERE transaction_type = 'qris'
ORDER BY amount DESC
LIMIT 10;
```

---

## Monthly Recap (Core Task)

This is what Task 01 is building toward.

### Example: Transactions by Month

```sql
SELECT 
    TO_CHAR(timestamp, 'YYYY-MM') as month,
    COUNT(*) as tx_count,
    SUM(amount) as tx_amount_sum
FROM transactions
GROUP BY TO_CHAR(timestamp, 'YYYY-MM')
ORDER BY month;
```

### Example: Monthly Recap for One User

```sql
SELECT 
    TO_CHAR(timestamp, 'YYYY-MM') as month,
    user_id,
    transaction_type,
    COUNT(*) as tx_count,
    SUM(amount) as tx_amount_sum
FROM transactions
WHERE user_id = 'user_001'
GROUP BY month, user_id, transaction_type
ORDER BY month, transaction_type;
```

### Challenge: Add Categorization

This requires a `CASE` statement to categorize transactions. Start simple:

```sql
SELECT 
    TO_CHAR(timestamp, 'YYYY-MM') as month,
    user_id,
    CASE 
        WHEN transaction_type = 'qris' AND merchant_name LIKE '%Alfamart%' THEN 'groceries'
        WHEN transaction_type = 'qris' AND merchant_name LIKE '%Indomaret%' THEN 'groceries'
        WHEN transaction_type = 'bill_payment' AND bill_type = 'PLN' THEN 'utilities'
        ELSE 'other'
    END as category,
    COUNT(*) as tx_count,
    SUM(amount) as tx_amount_sum
FROM transactions
GROUP BY month, user_id, category
ORDER BY month, user_id, category;
```

You'll need to expand the `CASE` statement to cover all categories.

---

## Useful psql Commands

| Command | Description |
|---------|-------------|
| `\q` | Quit psql |
| `\dt` | List all tables |
| `\d tablename` | Show table structure |
| `\l` | List all databases |
| `\?` | Show all psql commands |
| `\h SELECT` | Show help for SQL command |

---

## Reset / Reload Data

If you need to start over:

### Clear Table

```sql
TRUNCATE TABLE transactions;
```

### Reload CSV

```sql
\copy transactions FROM '/workspaces/transaction-recap/data/transactions.csv' WITH (FORMAT csv, HEADER true);
```

### Verify

```sql
SELECT COUNT(*) FROM transactions;
```

---

## Common Issues

### "psql: command not found"
PostgreSQL may not have started. Rebuild the Codespace or run:
```bash
sudo service postgresql start
```

### "COPY: permission denied"
Use `\copy` (with backslash), not `COPY`. The `\copy` command runs on the client side.

### "relation 'transactions' does not exist"
Run the init script:
```bash
psql -U postgres -d transaction_recap -f /workspaces/transaction-recap/.devcontainer/init.sql
```

---

## Next Steps

Once comfortable with basic queries:
1. Look at example queries in `sql/01_explore.sql`
2. Try building the monthly recap query in `sql/02_recap.sql`
3. Compare your SQL approach with your CSV approach from Task 01

SQL is just another way to express the same categorization logic you wrote in Task 01.
