CREATE OR REPLACE TABLE `web-analytics-funnel.web_analytics_funnel_staging.stg_transactions` AS
WITH base AS (
  SELECT
    CAST(s.fullVisitorId AS STRING) AS user_id,
    CONCAT(CAST(s.fullVisitorId AS STRING), '-', CAST(s.visitId AS STRING)) AS session_id,
    h.transaction.transactionId AS transaction_id,
    TIMESTAMP_SECONDS(s.visitStartTime) + INTERVAL h.time MILLISECOND AS transaction_ts,
    DATE(TIMESTAMP_SECONDS(s.visitStartTime)) AS session_date,
    SAFE_DIVIDE(h.transaction.transactionRevenue, 1e6) AS transaction_revenue,
    h.transaction.currencyCode AS currency_code,

    -- used to pick one "best" row per transaction
    h.hitNumber AS hit_number
  FROM `web-analytics-funnel.web_analytics_funnel_raw.raw_ga_sessions_all` s,
  UNNEST(s.hits) AS h
  WHERE h.transaction.transactionId IS NOT NULL
),
dedup AS (
  SELECT
    user_id,
    session_id,
    transaction_id,
    -- choose the earliest timestamp for the transaction
    MIN(transaction_ts) AS transaction_ts,
    ANY_VALUE(session_date) AS session_date,
    ANY_VALUE(currency_code) AS currency_code,
    -- choose max revenue observed for this transaction_id to avoid partials
    MAX(transaction_revenue) AS transaction_revenue
  FROM base
  GROUP BY user_id, session_id, transaction_id
)
SELECT * FROM dedup;
