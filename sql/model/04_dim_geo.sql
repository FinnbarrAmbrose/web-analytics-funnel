CREATE OR REPLACE TABLE `web-analytics-funnel.web_analytics_funnel.model_dim_geo` AS
SELECT
  TO_HEX(MD5(CONCAT(IFNULL(country,''),'|',IFNULL(region,''),'|',IFNULL(city,'')))) AS geo_id,
  country,
  region,
  city
FROM (
  SELECT DISTINCT country, region, city
  FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_sessions`
);
