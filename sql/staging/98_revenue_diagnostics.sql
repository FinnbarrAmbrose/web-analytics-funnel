-- Compare revenue definitions side-by-side
WITH session_rev AS (
  SELECT
    ROUND(SUM(SAFE_DIVIDE(totals.transactionRevenue, 1e6)), 2) AS session_level_revenue
  FROM `web-analytics-funnel.web_analytics_funnel_raw.raw_ga_sessions_all`
),
tx_rev AS (
  SELECT
    ROUND(SUM(transaction_revenue), 2) AS transaction_level_revenue
  FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_transactions`
),
tx_counts AS (
  SELECT
    COUNT(*) AS tx_rows,
    COUNT(DISTINCT transaction_id) AS tx_distinct
  FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_transactions`
)
SELECT * FROM session_rev, tx_rev, tx_counts;
