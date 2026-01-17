CREATE OR REPLACE TABLE `web-analytics-funnel.web_analytics_funnel_staging.stg_products` AS
SELECT
  CAST(s.fullVisitorId AS STRING) AS user_id,
  CONCAT(CAST(s.fullVisitorId AS STRING), '-', CAST(s.visitId AS STRING)) AS session_id,
  h.hitNumber AS hit_number,
  TIMESTAMP_SECONDS(s.visitStartTime) + INTERVAL h.time MILLISECOND AS hit_ts,
  DATE(TIMESTAMP_SECONDS(s.visitStartTime)) AS session_date,

  -- Ecommerce action at this hit
  h.eCommerceAction.action_type AS ecommerce_action_type,

  -- Product fields
  p.productSKU AS product_sku,
  p.v2ProductName AS product_name,
  p.v2ProductCategory AS product_category,
  p.productVariant AS product_variant,
  p.productBrand AS product_brand,
  p.productQuantity AS product_quantity,
  SAFE_DIVIDE(p.productRevenue, 1e6) AS product_revenue

FROM `web-analytics-funnel.web_analytics_funnel_raw.raw_ga_sessions_all` s,
UNNEST(s.hits) AS h,
UNNEST(h.product) AS p;
