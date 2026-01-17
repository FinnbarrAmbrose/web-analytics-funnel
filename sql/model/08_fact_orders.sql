CREATE OR REPLACE TABLE `web-analytics-funnel.web_analytics_funnel.model_fact_orders` AS
SELECT
  transaction_id AS order_id,
  session_id,
  user_id,
  FORMAT_DATE('%Y%m%d', session_date) AS date_key,
  transaction_ts AS order_ts,
  transaction_revenue AS revenue
FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_transactions`;
