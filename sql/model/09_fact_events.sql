CREATE OR REPLACE TABLE `web-analytics-funnel.web_analytics_funnel.model_fact_events` AS
SELECT
  h.session_id,
  h.user_id,
  FORMAT_DATE('%Y%m%d', h.session_date) AS date_key,
  h.hit_ts,
  h.hit_type,
  h.page_path,
  h.event_category,
  h.event_action,
  h.ecommerce_action_type,
  h.transaction_id
FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_hits` h;
