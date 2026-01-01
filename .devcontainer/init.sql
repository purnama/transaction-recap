-- Initialize transaction_recap database schema

-- Create transactions table
-- This table structure matches the CSV file in data/transactions.csv
CREATE TABLE IF NOT EXISTS transactions (
    user_id TEXT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    transaction_type TEXT NOT NULL,
    amount NUMERIC(15, 2) NOT NULL,
    merchant_name TEXT,
    bill_type TEXT,
    bank TEXT,
    notes TEXT
);

-- Display table structure
\d transactions

-- Display count of any existing records
SELECT COUNT(*) as record_count FROM transactions;

-- Show sample configuration
SELECT 'Database initialized successfully' as status;
SELECT 'To load data, run: \copy transactions FROM ''/workspaces/transaction-recap/data/transactions.csv'' WITH (FORMAT csv, HEADER true);' as next_step;
