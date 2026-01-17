CREATE OR REPLACE TABLE `web-analytics-funnel.web_analytics_funnel_staging.stg_hits` AS
SELECT
  CAST(s.fullVisitorId AS STRING) AS user_id,
  CONCAT(CAST(s.fullVisitorId AS STRING), '-', CAST(s.visitId AS STRING)) AS session_id,

  -- Hit identity
  h.hitNumber AS hit_number,
  TIMESTAMP_SECONDS(s.visitStartTime) + INTERVAL h.time MILLISECOND AS hit_ts,
  DATE(TIMESTAMP_SECONDS(s.visitStartTime)) AS session_date,

  -- Page
  h.type AS hit_type,
  h.page.pagePath AS page_path,
  h.page.pageTitle AS page_title,

  -- Event
  h.eventInfo.eventCategory AS event_category,
  h.eventInfo.eventAction AS event_action,
  h.eventInfo.eventLabel AS event_label,

  -- Ecommerce action (used for funnel)
  h.eCommerceAction.action_type AS ecommerce_action_type,

  -- Transaction at hit level (if present)
  h.transaction.transactionId AS transaction_id,
  SAFE_DIVIDE(h.transaction.transactionRevenue, 1e6) AS transaction_revenue

FROM `web-analytics-funnel.web_analytics_funnel_raw.raw_ga_sessions_all` s,
UNNEST(s.hits) AS h;
