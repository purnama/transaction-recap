# SQL Examples

This directory contains example SQL queries for exploring and analyzing transaction data.

## Files

- **01_explore.sql** — Basic exploration queries to understand the data
- **02_recap.sql** — Monthly recap query template with categorization logic

## How to Use

### Option 1: Run Entire File

From terminal:
```bash
psql -U postgres -d transaction_recap -f sql/01_explore.sql
```

### Option 2: Copy-Paste Individual Queries

1. Open the `.sql` file
2. Copy a query
3. In `psql`, paste and press Enter

### Option 3: Run from psql

Inside `psql`:
```sql
\i /workspaces/transaction-recap/sql/01_explore.sql
```

---

## Writing Your Own Queries

Create new `.sql` files in this directory as you experiment.

Example:
```bash
touch sql/my_experiments.sql
```

Then edit and run:
```bash
psql -U postgres -d transaction_recap -f sql/my_experiments.sql
```

---

## Best Practices

- Start each query with a comment describing what it does
- Test queries on small subsets first (use `LIMIT`)
- Format SQL for readability (indent, uppercase keywords)
- Save queries that work so you can reuse them

---

## Next Steps

After completing Task 01 with CSV, revisit these queries and compare:
- How did you categorize in CSV vs SQL?
- Which approach felt clearer?
- What was harder or easier in SQL?
