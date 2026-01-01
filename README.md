# Transaction Recap — Learning Project

## What This Is

This repository is used for remote mentoring through practical work.

The goal is to learn independence, responsibility, and problem-solving by working with real transaction data and producing business reports.

This is not a tutorial, a production system, or an application project. This is a **learning-by-doing workspace**.

---

## Repository Structure

```
transaction-recap/
├── README.md                      # This file
├── tasks/                         # Task definitions
│   └── TASK_01_CATEGORIZE_AND_RECAP.md
├── data/                          # Source datasets
│   ├── README.md
│   └── transactions.csv
├── docs/                          # Documentation
│   └── POSTGRES_SETUP.md          # SQL/PostgreSQL guide
├── sql/                           # SQL examples
│   ├── 01_explore.sql             # Exploration queries
│   ├── 02_recap.sql               # Recap query template
│   └── README.md
└── submissions/                   # Work submissions
    └── shawn/
        ├── MAPPING.md             # Categorization rules
        ├── recap.csv              # Monthly recap output
        └── NOTES.md               # Assumptions & reconciliation
```

---

## How This Works

### Tasks
Each task is defined in the `tasks/` directory. Tasks describe:
- The problem to solve
- Required outputs
- Definition of done

### Submissions
Work is submitted in `submissions/<name>/` directories. Each submission includes:
- Artifacts (files, reports, etc.)
- Documentation explaining decisions and assumptions

### Review
Completed work is reviewed based on:
- Clarity of reasoning
- Honesty about uncertainty
- Reconciliation with source data
- Ability to explain decisions

---

## Current Task: Task 01 — Categorize & Recap

Read the full task description in [tasks/TASK_01_CATEGORIZE_AND_RECAP.md](tasks/TASK_01_CATEGORIZE_AND_RECAP.md).

**Summary**: Analyze transaction data, create categorization rules, and produce a monthly spending recap per user by category.

**Approach**: Use any tool that helps you understand the data. The goal is clear thinking and explanation, not tool mastery.

**Output**: Place all deliverables in `submissions/shawn/`

---

## Boundaries

### Not Allowed
- Backend frameworks (Java, Spring Boot, etc.)
- DevOps tooling (Docker, CI/CD, etc.)
- Production-grade infrastructure
- Over-engineering

### Allowed
- CSV files and spreadsheets (Excel, Google Sheets, etc.)
- SQL and PostgreSQL (see `docs/POSTGRES_SETUP.md`)
- Simple scripts (Python, if helpful)
- Any tool that helps you think clearly
- AI tools (with accountability)

### Using AI
AI tools are allowed as thinking aids. However:
- Copy–paste without understanding is not allowed
- Any AI-assisted work must be explainable in your own words

---

## Philosophy

- Work comes before theory
- Problems come before tools
- Explanation matters more than speed
- Redo is normal, not a penalty
- "I don't know" is acceptable; pretending is not
- Tools are means, not ends — use what helps you think clearly

Success means understanding how data represents reality, structuring thinking clearly, and being accountable for work quality.

---

## Using SQL (Optional)

PostgreSQL is available in this Codespace for those who want to learn SQL.

**To get started**:
1. Read [docs/POSTGRES_SETUP.md](docs/POSTGRES_SETUP.md)
2. Connect: `psql -U postgres -d transaction_recap`
3. Load data and run example queries in `sql/`

SQL is just another way to express categorization logic. Whether you use CSV, Python, or SQL — the thinking process is the same.
