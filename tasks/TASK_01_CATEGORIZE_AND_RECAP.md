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
- SQL and PostgreSQL (see `docs/POSTGRES_SETUP.md`)
- Simple scripts (Python with pandas, if you prefer)
- Text editor
- Calculator
- AI tools (see guidelines below)

### Not Allowed
- Backend frameworks or applications
- Production-grade infrastructure
- Over-engineering

**Important**: The tool you choose doesn't matter. What matters is:
- Can you explain your categorization logic clearly?
- Can you prove your totals reconcile?
- Can you document ambiguous cases honestly?

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

You have multiple ways to complete this task. Choose what makes sense to you.

### Option A: Spreadsheet-only
1. Open `data/transactions.csv` in Excel/Google Sheets
2. Add a new column called "category"
3. Manually assign categories based on your rules (or use formulas)
4. Use pivot tables or SUMIF/COUNTIF to create the recap
5. Export recap to `recap.csv`

**Good for**: Visual thinkers, those comfortable with Excel

### Option B: Python Script
1. Read `data/transactions.csv` with pandas
2. Write if/else logic to assign categories
3. Use `groupby` to create the recap
4. Export to `recap.csv`

**Good for**: Those who want to learn Python, automating repetitive logic

### Option C: SQL Queries
1. Load data into PostgreSQL (see `docs/POSTGRES_SETUP.md`)
2. Write `CASE` statements to categorize transactions
3. Use `GROUP BY` to create the recap
4. Export results to `recap.csv`

**Good for**: Learning SQL, expressing categorization as queries

### Option D: Mixed Approach
Use spreadsheets for exploration, then Python or SQL for generating the final recap. Or vice versa.

**The tool doesn't matter. What matters is clear thinking and explanation.**

---

## Approach Details

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
- With SQL queries (see `docs/POSTGRES_SETUP.md` and `sql/02_recap.sql`)
- Any approach that works for you

**Hint**: If you choose SQL, the categorization logic goes in a `CASE` statement. If you choose spreadsheets, it goes in formulas or manual rules. The logic is the same, just expressed differently.

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

After completing Task 01, you'll have categorization logic documented in `MAPPING.md`.

Whether you used CSV, spreadsheets, Python, or SQL — the logic is the same. You've learned:
- How to think about categorizing real-world data
- How to handle ambiguity
- How to verify your work through reconciliation

Future tasks will build on this foundation, exploring different ways to structure and query data at scale.