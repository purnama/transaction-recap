-- 01_explore.sql
-- Basic exploration queries to understand transaction data

-- =============================================================================
-- Question 1: How many transactions do we have?
-- =============================================================================
SELECT COUNT(*) as total_transactions FROM transactions;


-- =============================================================================
-- Question 2: What transaction types exist?
-- =============================================================================
SELECT 
    transaction_type, 
    COUNT(*) as count 
FROM transactions 
GROUP BY transaction_type 
ORDER BY count DESC;


-- =============================================================================
-- Question 3: What's the date range of our data?
-- =============================================================================
SELECT 
    MIN(timestamp) as earliest_transaction,
    MAX(timestamp) as latest_transaction,
    MAX(timestamp) - MIN(timestamp) as date_range
FROM transactions;


-- =============================================================================
-- Question 4: How many transactions per user?
-- =============================================================================
SELECT 
    user_id,
    COUNT(*) as tx_count,
    SUM(amount) as total_amount,
    AVG(amount) as avg_amount,
    MIN(amount) as min_amount,
    MAX(amount) as max_amount
FROM transactions
GROUP BY user_id
ORDER BY user_id;


-- =============================================================================
-- Question 5: What are the most common merchants (for QRIS transactions)?
-- =============================================================================
SELECT 
    merchant_name,
    COUNT(*) as visit_count,
    SUM(amount) as total_spent,
    AVG(amount) as avg_spent
FROM transactions
WHERE transaction_type = 'qris' 
  AND merchant_name IS NOT NULL
GROUP BY merchant_name
ORDER BY visit_count DESC
LIMIT 10;


-- =============================================================================
-- Question 6: What bill types exist and how common are they?
-- =============================================================================
SELECT 
    bill_type,
    COUNT(*) as payment_count,
    SUM(amount) as total_amount,
    AVG(amount) as avg_amount
FROM transactions
WHERE transaction_type = 'bill_payment'
  AND bill_type IS NOT NULL
GROUP BY bill_type
ORDER BY payment_count DESC;


-- =============================================================================
-- Question 7: What banks are used for topup transactions?
-- =============================================================================
SELECT 
    bank,
    COUNT(*) as topup_count,
    SUM(amount) as total_topup_amount,
    AVG(amount) as avg_topup_amount
FROM transactions
WHERE transaction_type = 'topup'
  AND bank IS NOT NULL
GROUP BY bank
ORDER BY topup_count DESC;


-- =============================================================================
-- Question 8: What are the largest transactions by type?
-- =============================================================================
SELECT 
    transaction_type,
    user_id,
    timestamp,
    amount,
    COALESCE(merchant_name, bill_type, bank, 'N/A') as description
FROM transactions
WHERE amount >= 1000000
ORDER BY amount DESC;


-- =============================================================================
-- Question 9: How many transactions per month?
-- =============================================================================
SELECT 
    TO_CHAR(timestamp, 'YYYY-MM') as month,
    COUNT(*) as tx_count,
    SUM(amount) as total_amount
FROM transactions
GROUP BY month
ORDER BY month;


-- =============================================================================
-- Question 10: Sample of different transaction types
-- =============================================================================

-- QRIS sample
SELECT 'QRIS Sample' as type;
SELECT user_id, timestamp, amount, merchant_name 
FROM transactions 
WHERE transaction_type = 'qris' 
LIMIT 3;

-- Bill Payment sample
SELECT 'Bill Payment Sample' as type;
SELECT user_id, timestamp, amount, bill_type 
FROM transactions 
WHERE transaction_type = 'bill_payment' 
LIMIT 3;

-- Topup sample
SELECT 'Topup Sample' as type;
SELECT user_id, timestamp, amount, bank 
FROM transactions 
WHERE transaction_type = 'topup' 
LIMIT 3;

-- Cashout sample
SELECT 'Cashout Sample' as type;
SELECT user_id, timestamp, amount, bank, notes 
FROM transactions 
WHERE transaction_type = 'cashout' 
LIMIT 3;
