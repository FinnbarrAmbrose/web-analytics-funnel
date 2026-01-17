CREATE OR REPLACE TABLE `web-analytics-funnel.web_analytics_funnel.model_dim_user` AS
WITH first_seen AS (
  SELECT
    user_id,
    MIN(session_date) AS first_seen_date
  FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_sessions`
  GROUP BY user_id
)
SELECT
  user_id,
  FORMAT_DATE('%Y%m%d', first_seen_date) AS first_seen_date_key,
  first_seen_date
FROM first_seen;
