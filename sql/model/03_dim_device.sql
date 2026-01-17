CREATE OR REPLACE TABLE `web-analytics-funnel.web_analytics_funnel.model_dim_device` AS
SELECT
  TO_HEX(MD5(CONCAT(IFNULL(device_category,''),'|',IFNULL(operating_system,''),'|',IFNULL(browser,'')))) AS device_id,
  device_category,
  operating_system,
  browser
FROM (
  SELECT DISTINCT device_category, operating_system, browser
  FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_sessions`
);
