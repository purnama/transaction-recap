-- 02_recap.sql
-- Monthly recap query with categorization logic
-- This produces output similar to the recap.csv from Task 01

-- =============================================================================
-- Goal: Create monthly spending recap per user by category
-- Output columns: month, user_id, category, tx_count, tx_amount_sum
-- =============================================================================

-- STEP 1: Define categorization logic
-- This is a template. You need to fill in the CASE logic based on your Task 01 mapping.

SELECT 
    TO_CHAR(timestamp, 'YYYY-MM') as month,
    user_id,
    
    -- Categorization logic (INCOMPLETE - you must complete this)
    CASE 
        -- Groceries
        WHEN transaction_type = 'qris' AND (
            merchant_name LIKE '%Alfamart%' OR 
            merchant_name LIKE '%Indomaret%'
        ) THEN 'groceries'
        
        -- Utilities
        WHEN transaction_type = 'bill_payment' AND bill_type = 'PLN' THEN 'utilities'
        WHEN transaction_type = 'bill_payment' AND bill_type LIKE 'PDAM%' THEN 'utilities'
        
        -- Telecommunication
        WHEN transaction_type = 'bill_payment' AND (
            bill_type LIKE 'TELKOMSEL%' OR
            bill_type LIKE 'XL%' OR
            bill_type LIKE 'INDOSAT%' OR
            bill_type LIKE 'IM3%' OR
            bill_type = 'Indihome' OR
            bill_type = 'Biznet'
        ) THEN 'telecommunication'
        
        -- Mortgage
        WHEN transaction_type = 'bill_payment' AND bill_type LIKE 'KPR%' THEN 'mortgage'
        
        -- Insurance
        WHEN transaction_type = 'bill_payment' AND (
            bill_type LIKE '%Life Insurance%' OR
            bill_type LIKE 'Prudential%'
        ) THEN 'insurance'
        
        -- Investment
        WHEN transaction_type = 'bill_payment' AND bill_type LIKE '%Investasi%' THEN 'investment'
        
        -- Debt Repayment
        WHEN transaction_type = 'bill_payment' AND bill_type LIKE '%Credit Card%' THEN 'debt_repayment'
        
        -- Cash Management
        WHEN transaction_type IN ('topup', 'cashout') THEN 'cash_management'
        
        -- TODO: Add more categories:
        -- - transport (Grab, Gojek, etc.)
        -- - entertainment (Cinema, etc.)
        -- - health (Apotek, etc.)
        -- - other (everything else)
        
        ELSE 'other'
    END as category,
    
    COUNT(*) as tx_count,
    SUM(amount) as tx_amount_sum
    
FROM transactions

GROUP BY month, user_id, category
ORDER BY month, user_id, category;


-- =============================================================================
-- STEP 2: Verify totals match source data
-- =============================================================================

-- Total from source
SELECT 
    'Source Totals' as label,
    COUNT(*) as total_tx_count,
    SUM(amount) as total_tx_amount
FROM transactions;

-- Total from recap (should match above)
WITH recap AS (
    SELECT 
        TO_CHAR(timestamp, 'YYYY-MM') as month,
        user_id,
        CASE 
            WHEN transaction_type = 'qris' AND (
                merchant_name LIKE '%Alfamart%' OR 
                merchant_name LIKE '%Indomaret%'
            ) THEN 'groceries'
            WHEN transaction_type = 'bill_payment' AND bill_type = 'PLN' THEN 'utilities'
            WHEN transaction_type = 'bill_payment' AND bill_type LIKE 'PDAM%' THEN 'utilities'
            WHEN transaction_type = 'bill_payment' AND (
                bill_type LIKE 'TELKOMSEL%' OR
                bill_type LIKE 'XL%' OR
                bill_type LIKE 'INDOSAT%' OR
                bill_type LIKE 'IM3%' OR
                bill_type = 'Indihome' OR
                bill_type = 'Biznet'
            ) THEN 'telecommunication'
            WHEN transaction_type = 'bill_payment' AND bill_type LIKE 'KPR%' THEN 'mortgage'
            WHEN transaction_type = 'bill_payment' AND (
                bill_type LIKE '%Life Insurance%' OR
                bill_type LIKE 'Prudential%'
            ) THEN 'insurance'
            WHEN transaction_type = 'bill_payment' AND bill_type LIKE '%Investasi%' THEN 'investment'
            WHEN transaction_type = 'bill_payment' AND bill_type LIKE '%Credit Card%' THEN 'debt_repayment'
            WHEN transaction_type IN ('topup', 'cashout') THEN 'cash_management'
            ELSE 'other'
        END as category,
        COUNT(*) as tx_count,
        SUM(amount) as tx_amount_sum
    FROM transactions
    GROUP BY month, user_id, category
)
SELECT 
    'Recap Totals' as label,
    SUM(tx_count) as total_tx_count,
    SUM(tx_amount_sum) as total_tx_amount
FROM recap;


-- =============================================================================
-- STEP 3: Show uncategorized or 'other' transactions
-- =============================================================================

SELECT 
    transaction_type,
    merchant_name,
    bill_type,
    bank,
    COUNT(*) as count
FROM transactions
WHERE 
    -- Apply same categorization logic, but filter for 'other'
    CASE 
        WHEN transaction_type = 'qris' AND (
            merchant_name LIKE '%Alfamart%' OR 
            merchant_name LIKE '%Indomaret%'
        ) THEN 'groceries'
        WHEN transaction_type = 'bill_payment' AND bill_type = 'PLN' THEN 'utilities'
        WHEN transaction_type = 'bill_payment' AND bill_type LIKE 'PDAM%' THEN 'utilities'
        WHEN transaction_type = 'bill_payment' AND (
            bill_type LIKE 'TELKOMSEL%' OR
            bill_type LIKE 'XL%' OR
            bill_type LIKE 'INDOSAT%' OR
            bill_type LIKE 'IM3%' OR
            bill_type = 'Indihome' OR
            bill_type = 'Biznet'
        ) THEN 'telecommunication'
        WHEN transaction_type = 'bill_payment' AND bill_type LIKE 'KPR%' THEN 'mortgage'
        WHEN transaction_type = 'bill_payment' AND (
            bill_type LIKE '%Life Insurance%' OR
            bill_type LIKE 'Prudential%'
        ) THEN 'insurance'
        WHEN transaction_type = 'bill_payment' AND bill_type LIKE '%Investasi%' THEN 'investment'
        WHEN transaction_type = 'bill_payment' AND bill_type LIKE '%Credit Card%' THEN 'debt_repayment'
        WHEN transaction_type IN ('topup', 'cashout') THEN 'cash_management'
        ELSE 'other'
    END = 'other'
GROUP BY transaction_type, merchant_name, bill_type, bank
ORDER BY count DESC;


-- =============================================================================
-- NOTES
-- =============================================================================

-- This query is intentionally incomplete.
-- Complete the CASE statement based on your Task 01 mapping rules.
-- 
-- Questions to consider:
-- 1. Does your categorization logic match what you did in Task 01?
-- 2. Are any transactions falling into 'other' that shouldn't?
-- 3. Do the totals reconcile?
--
-- SQL is just another way to express the same logic you wrote in mapping.md.
