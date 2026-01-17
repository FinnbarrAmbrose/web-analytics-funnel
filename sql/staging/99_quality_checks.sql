-- 1) Sessions row count
SELECT COUNT(*) AS stg_sessions_rows
FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_sessions`;

-- 2) Transactions: row count vs distinct IDs
SELECT
  COUNT(*) AS stg_transaction_rows,
  COUNT(DISTINCT transaction_id) AS transaction_ids
FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_transactions`;

-- 3) Null key checks
SELECT
  SUM(CASE WHEN session_id IS NULL THEN 1 ELSE 0 END) AS null_session_id,
  SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS null_user_id
FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_sessions`;

-- 4) Revenue (transaction-level)
SELECT
  ROUND(SUM(transaction_revenue), 2) AS stg_transaction_revenue
FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_transactions`;
