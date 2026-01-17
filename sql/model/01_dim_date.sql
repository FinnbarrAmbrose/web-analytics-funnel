CREATE OR REPLACE TABLE `web-analytics-funnel.web_analytics_funnel.model_dim_date` AS
WITH dates AS (
  SELECT DISTINCT session_date AS date
  FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_sessions`
)
SELECT
  FORMAT_DATE('%Y%m%d', date) AS date_key,
  date,
  EXTRACT(YEAR FROM date) AS year,
  EXTRACT(MONTH FROM date) AS month,
  EXTRACT(WEEK FROM date) AS week,
  EXTRACT(QUARTER FROM date) AS quarter
FROM dates;
