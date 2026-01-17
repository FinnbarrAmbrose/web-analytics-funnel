CREATE OR REPLACE TABLE `web-analytics-funnel.web_analytics_funnel.model_dim_product` AS
SELECT
  TO_HEX(MD5(CONCAT(IFNULL(product_sku,''),'|',IFNULL(product_name,''),'|',IFNULL(product_category,'')))) AS product_id,
  product_sku,
  product_name,
  product_category,
  product_variant,
  product_brand
FROM (
  SELECT DISTINCT
    product_sku,
    product_name,
    product_category,
    product_variant,
    product_brand
  FROM `web-analytics-funnel.web_analytics_funnel_staging.stg_products`
);
