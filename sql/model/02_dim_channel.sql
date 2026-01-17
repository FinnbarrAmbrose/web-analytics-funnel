CREATE OR REPLACE TABLE `web-analytics-funnel.web_analytics_funnel.model_dim_channel` AS
SELECT
  TO_HEX(MD5(CONCAT(IFNULL(source,''),'|',IFNULL(medium,''),'|',IFNULL(campaign,'')))) AS channel_id,
  source,
  medium,
  campaign
FROM (
  SELECT DISTINCT source, medium, campaign
  FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_sessions`
);
