CREATE OR REPLACE TABLE `web-analytics-funnel.web_analytics_funnel.model_fact_sessions` AS
WITH s AS (
  SELECT *
  FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_sessions`
)
SELECT
  s.session_id,
  s.user_id,
  FORMAT_DATE('%Y%m%d', s.session_date) AS date_key,

  ch.channel_id,
  dv.device_id,
  ge.geo_id,

  s.pageviews,
  s.hits,
  s.bounces,
  s.time_on_site_seconds,

  -- keep raw totals for reconciliation
  s.transactions AS session_transactions,
  s.transaction_revenue AS session_revenue

FROM s
LEFT JOIN `web-analytics-funnel.web_analytics_funnel.model_dim_channel` ch
  ON s.source = ch.source AND s.medium = ch.medium AND s.campaign = ch.campaign
LEFT JOIN `web-analytics-funnel.web_analytics_funnel.model_dim_device` dv
  ON s.device_category = dv.device_category AND s.operating_system = dv.operating_system AND s.browser = dv.browser
LEFT JOIN `web-analytics-funnel.web_analytics_funnel.model_dim_geo` ge
  ON s.country = ge.country AND s.region = ge.region AND s.city = ge.city;
