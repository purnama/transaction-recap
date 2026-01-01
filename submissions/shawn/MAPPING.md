# Categorization Mapping Rules

## Purpose
This document explains how transactions are categorized into spending categories.

---

## Categories
- groceries
- telecommunication
- utilities
- transport
- entertainment
- health
- insurance
- investment
- debt_repayment
- mortgage
- cash_management
- other

---

## Categorization Rules

### Bill Payment Rules

[Document your rules for bill_payment transactions here]

Example format:
> **Rule 1**: If `transaction_type` = "bill_payment" AND `bill_type` = "electricity", THEN category = "utilities"

### QRIS Transaction Rules

[Document your rules for qris transactions here]

Example format:
> **Rule 2**: If `transaction_type` = "qris" AND `merchant_name` contains "Alfamart" OR "Indomaret", THEN category = "groceries"

### Topup and Cashout Rules

[Document your rules for topup and cashout transactions here]

### Other Rules

[Document any additional rules here]

---

## Ambiguous Cases

Document transactions that were difficult to categorize.

Example format:
> **Transaction**: user_001, qris, 250000, "Cinema XXI Senayan"  
> **Ambiguity**: Could be "entertainment" or "other"  
> **Decision**: Categorized as "entertainment"  
> **Reasoning**: Movie theaters are typically entertainment expenses

### Your Ambiguous Cases

[Document your ambiguous cases here]

---

## Uncategorized Transactions

List any transactions you could not confidently categorize.

[Document uncategorized transactions here, if any]

---

## Notes & Assumptions

[Add any additional context about your categorization approach]