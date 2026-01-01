# Task 01 — Categorize Transactions & Create Monthly Recap

## Objective

Analyze transaction data, define categorization rules, and produce a monthly spending recap per user grouped by spending category.

---

## Context

You have a dataset of transactions from multiple users. Each transaction includes:
- `user_id`
- `timestamp`
- `transaction_type` (qris, bill_payment, topup, cashout, etc.)
- `amount`
- optional: `merchant_name` (for QRIS transactions)
- optional: `bill_type` (for bill payments)

Your job is to turn this raw data into a useful business report.

---

## Input

**File**: `data/transactions.csv`

This file contains 200+ transactions across:
- 5 users
- 3 months (October–December 2025)
- Various transaction types and merchants

---

## Required Outputs

All outputs must be placed in `submissions/shawn/`.

### 1. `MAPPING.md`
Plain-language rules explaining how you categorize transactions.

**Example**:
> **Rule 1**: If `transaction_type` = "bill_payment" AND `bill_type` = "electricity", THEN category = "utilities"
>
> **Rule 2**: If `transaction_type` = "qris" AND `merchant_name` contains "Alfamart" OR "Indomaret", THEN category = "groceries"

**Include**:
- All categorization rules
- Reasoning for ambiguous cases
- Edge cases or unclear data

### 2. `recap.csv`
Aggregated monthly spending per user by category.

**Format**:
```csv
month,user_id,category,tx_count,tx_amount_sum
2025-10,user_001,groceries,4,250000
2025-10,user_001,utilities,2,550000
...
```

**Columns**:
- `month`: YYYY-MM format
- `user_id`: user identifier
- `category`: spending category (see list below)
- `tx_count`: number of transactions in this month/user/category
- `tx_amount_sum`: total amount spent in this month/user/category

### 3. `NOTES.md`
Documentation of your work process.

**Required Sections**:
- **Assumptions**: What did you assume while working?
- **Data Quality Issues**: Missing data, inconsistencies, unclear values
- **Ambiguous Cases**: Transactions that were hard to categorize
- **Reconciliation**: Prove your totals match the source data
  - Total transaction count from source
  - Total transaction amount from source
  - Total tx_count from recap
  - Total tx_amount_sum from recap
  - Explanation if they differ

---

## Spending Categories

Use exactly these categories. Do not create new ones.

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

## Constraints

### Allowed Tools
- CSV files
- Spreadsheets (Excel, Google Sheets, LibreOffice Calc)
- Simple scripts (Python with pandas, if you prefer)
- Text editor
- Calculator
- AI tools (see guidelines below)

### Not Allowed
- SQL or databases
- Backend frameworks
- Over-engineering

### AI Usage Guidelines
- AI tools (ChatGPT, Copilot, etc.) are allowed as thinking aids
- Copy–paste without understanding is not allowed
- You must be able to explain any AI-assisted work in your own words

---

## Definition of Done

The task is **complete** only when:

1. All three required files exist in `submissions/shawn/`
2. Categorization rules are explainable in plain language
3. Aggregated totals reconcile with source data
4. Ambiguity is explicitly documented (not hidden)
5. You can explain:
   - What one row in `recap.csv` represents
   - Why you chose specific categorization rules
   - What business decisions this report could support

**Speed does not matter. Clarity and accuracy do.**

---

## Approach Suggestions

### Step 1: Understand the Data (30–60 minutes)
Open `data/transactions.csv` and answer:
- What columns exist?
- What values appear in each column?
- What patterns do you see?
- What's ambiguous or unclear?

Write down your observations.

### Step 2: Define Categorization Rules (1–2 hours)
Look at the categories list and the transaction data.

Create rules in plain language:
- If [condition], then category = [category]
- Document why you chose each rule
- Note cases where you're unsure

Write these in `MAPPING.md`.

### Step 3: Apply Rules (2–3 hours)
Go through each transaction and assign a category.

Methods:
- Manually in a spreadsheet
- With a Python script
- Any approach that works for you

### Step 4: Create Recap (1–2 hours)
Aggregate transactions by (month, user_id, category):
- Count transactions per group
- Sum amounts per group

Export to `recap.csv`.

### Step 5: Reconcile (30–60 minutes)
Verify your recap matches the source data:
- Count total transactions in source
- Sum total amounts in source
- Compare with recap totals
- Document any differences

Write reconciliation in `notes.md`.

---

## Common Questions

### "What if I can't categorize a transaction?"
Document it in `NOTES.md` as an ambiguous case. Explain why it's unclear and what category you chose (or didn't choose).

### "What if my totals don't match?"
Figure out why. Check for:
- Missing transactions
- Duplicate transactions
- Calculation errors
- Transactions you excluded

Document the issue in `NOTES.md`.

### "Can I create subcategories?"
No. Use only the provided categories. If something doesn't fit, use "other" and document why.

### "How should I handle topup and cashout?"
These are cash management activities, not spending. Consider categorizing them as "cash_management" or document your reasoning if you handle them differently.

---

## Review Criteria

Your work will be reviewed based on:
- **Clarity**: Can you explain your decisions?
- **Honesty**: Did you acknowledge uncertainty?
- **Accuracy**: Do your totals reconcile?
- **Reasoning**: Are your categorization rules logical?

Redo is normal. It's not a penalty.

---

## Getting Help

If you're stuck:
1. Write down what you tried
2. Write down what went wrong
3. Write down what you think the problem is
4. Ask for help with that specific issue

Be specific. "I don't know how to start" is too vague. "I can't figure out how to categorize 'Tokopedia - Electronics' because I don't know what was purchased" is a good question.

---

## Next Steps

After Task 01 is completed and reviewed, future tasks will introduce:
- SQL as a query language
- PostgreSQL for data storage
- More complex reporting

But not yet. Complete this task first.