# Task 01 Notes

## Purpose
This document contains assumptions, observations, and reconciliation of the transaction data.

---

## Assumptions

Document all assumptions made while working on this task.

Example:
1. "topup" transactions represent adding money to a wallet, categorized as "cash_management"
2. "cashout" transactions represent withdrawing money, categorized as "cash_management"
3. Transactions without merchant_name or bill_type were categorized based on transaction_type alone

### Your Assumptions

[Add your assumptions here]

---

## Data Quality Issues

Document any problems found in the data.

Example:
- Missing merchant_name for some QRIS transactions
- Inconsistent naming: "Alfamart Sudirman" vs "Alfamart Menteng"
- Unclear bill_type values

### Your Observations

[Add your data quality observations here]

---

## Ambiguous Merchants & Bill Types

Document merchants or bill types that were difficult to categorize.

Example:
- **"Tokopedia - Electronics"**: Could be groceries, health, entertainment, or other depending on what was purchased
- **"GoFood - McDonald's"**: Food delivery — categorized as groceries or entertainment?

### Your Ambiguous Cases

[Add your ambiguous cases here]

---

## Reconciliation

This section proves your recap matches the source data.

### Source Data Totals (from data/transactions.csv)
- Total transaction count: [calculate this]
- Total transaction amount: [calculate this]
- Date range: [first date] to [last date]
- Number of unique users: [count this]

### Recap Totals (from submissions/shawn/recap.csv)
- Total tx_count (sum of all tx_count): [calculate this]
- Total tx_amount_sum (sum of all tx_amount_sum): [calculate this]
- Number of unique users: [count this]
- Number of unique months: [count this]

### Reconciliation Check

**Do the totals match?**
- Source count vs Recap count: [compare]
- Source amount vs Recap amount: [compare]

**If they don't match, explain why:**
- [Document any differences]
- [Explain any excluded transactions]

---

## Monthly Breakdown by User

Provide a summary for each user to verify the recap makes sense.

Example:
**user_001**
- 2025-10: X transactions, total amount Y
- 2025-11: X transactions, total amount Y
- 2025-12: X transactions, total amount Y

### Your Breakdown

[Add your monthly breakdown here]

---

## Business Insights

Based on your analysis, what could someone learn from this recap?

Example:
- User spending patterns
- Common expense categories
- Regular vs irregular expenses

### Your Insights

[Add your insights here]

---

## Questions & Uncertainties

List anything you're unsure about or would like feedback on.

[Add your questions here]