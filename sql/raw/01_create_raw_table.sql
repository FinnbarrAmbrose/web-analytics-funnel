CREATE OR REPLACE VIEW `web-analytics-funnel.web_analytics_funnel_raw.raw_ga_sessions_all` AS
SELECT *
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`;
