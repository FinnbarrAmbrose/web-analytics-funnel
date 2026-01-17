SELECT
  COUNT(*) AS row_count,
  COUNT(DISTINCT fullVisitorId) AS users,
  COUNT(DISTINCT visitId) AS sessions,
  SUM(totals.transactions) AS transactions,
  SUM(totals.transactionRevenue) / 1e6 AS revenue
FROM `web-analytics-funnel.web_analytics_funnel_raw.raw_ga_sessions_all`;
