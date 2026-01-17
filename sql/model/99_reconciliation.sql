SELECT
  (SELECT COUNT(*) FROM `web-analytics-funnel.web_analytics_funnel.model_fact_sessions`) AS fact_sessions,
  (SELECT COUNT(*) FROM `web-analytics-funnel.web_analytics_funnel.model_fact_orders`) AS fact_orders,
  (SELECT ROUND(SUM(revenue),2) FROM `web-analytics-funnel.web_analytics_funnel.model_fact_orders`) AS orders_revenue,
  (SELECT ROUND(SUM(session_revenue),2) FROM `web-analytics-funnel.web_analytics_funnel.model_fact_sessions`) AS session_revenue
;
