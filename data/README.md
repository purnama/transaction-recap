# Data Directory

This directory contains source datasets used for learning tasks.

## Current Datasets

### transactions.csv
Transaction data from multiple users including:
- User identifiers
- Timestamps
- Transaction types (QRIS, bill payments, topups, cashouts)
- Amounts
- Merchant names (where applicable)
- Bill types (where applicable)

**Coverage**: October–December 2025, 5 users, 200+ transactions

---

## Data Handling Guidelines

- This is synthetic data created for learning purposes
- In real-world scenarios, always check if data is confidential or sensitive
- Do not modify source data files directly
- Create derived outputs in the `submissions/` directory