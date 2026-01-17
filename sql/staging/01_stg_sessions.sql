CREATE OR REPLACE TABLE `web-analytics-funnel.web_analytics_funnel_staging.stg_sessions` AS
SELECT
  -- IDs
  CAST(fullVisitorId AS STRING) AS user_id,
  CONCAT(CAST(fullVisitorId AS STRING), '-', CAST(visitId AS STRING)) AS session_id,
  CAST(visitId AS INT64) AS visit_id,

  -- Time
  TIMESTAMP_SECONDS(visitStartTime) AS session_start_ts,
  DATE(TIMESTAMP_SECONDS(visitStartTime)) AS session_date,

  -- Acquisition
  trafficSource.source AS source,
  trafficSource.medium AS medium,
  trafficSource.campaign AS campaign,

  -- Device / Geo
  device.deviceCategory AS device_category,
  device.operatingSystem AS operating_system,
  device.browser AS browser,
  geoNetwork.country AS country,
  geoNetwork.region AS region,
  geoNetwork.city AS city,

  -- Session totals
  totals.visits AS visits,
  totals.hits AS hits,
  totals.pageviews AS pageviews,
  totals.bounces AS bounces,
  totals.newVisits AS new_visits,
  totals.timeOnSite AS time_on_site_seconds,

  -- Commerce totals
  totals.transactions AS transactions,
  SAFE_DIVIDE(totals.transactionRevenue, 1e6) AS transaction_revenue,
  SAFE_DIVIDE(totals.totalTransactionRevenue, 1e6) AS total_transaction_revenue

FROM `web-analytics-funnel.web_analytics_funnel_raw.raw_ga_sessions_all`;
SELECT
  COUNT(*) AS row_count,
  COUNT(DISTINCT user_id) AS users,
  COUNT(DISTINCT session_id) AS sessions,
  SUM(transactions) AS transactions,
  SUM(transaction_revenue) AS revenue
FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_sessions`;