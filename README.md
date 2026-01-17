# Web Analytics Funnel — BigQuery Analytics Engineering Project

End-to-end e-commerce web analytics platform using Google BigQuery, Kimball star schema modelling, and executive dashboards.

## Objective

Build a real-world analytics warehouse workflow analysing:
- Traffic & sessions
- Funnel performance
- Conversion & revenue
- Attribution
- Product & channel performance

## Tech Stack

- Google Cloud Platform
- BigQuery (warehouse)
- BigQuery SQL (transformations)
- Kimball star schema
- Looker Studio (BI)
- Python + Jupyter (analysis)
- GitHub (version control)

## Architecture

Source (Google Analytics)  
→ Raw BigQuery tables  
→ Staging layer  
→ Star schema (facts & dimensions)  
→ KPI reporting views  
→ Executive dashboards  

## Project Structure

See repo folder structure for engineering layers.
# Web Analytics Funnel — BigQuery Analytics Engineering Project

End-to-end e-commerce analytics warehouse built using Google BigQuery, Kimball star schema modelling, and executive KPI marts.

This project demonstrates real-world analytics engineering skills:
- Raw ingestion from Google Analytics
- Data quality & staging layer
- Kimball star schema modelling
- KPI marts for funnel, revenue, and attribution
- Executive-ready reporting layer

---

## Project Objective

Build an end-to-end e-commerce analytics warehouse using Google BigQuery and a Kimball star schema to analyse:

- Traffic & acquisition
- Funnel performance
- Conversion & revenue
- Attribution
- Product, device, and geo performance

Deliver clean, decision-ready KPI marts for executive reporting.

---

## Architecture
Google Analytics (Public Dataset)
↓
Raw Layer (BigQuery View)
↓
Staging Layer (Cleaned & Deduplicated Tables)
↓
Analytics Warehouse (Kimball Star Schema)
↓
KPI Marts
↓
Executive Dashboard

---

## Tech Stack

- Platform: Google Cloud BigQuery  
- SQL: BigQuery SQL  
- Modelling: Kimball Star Schema  
- Python: BigQuery client + orchestration scripts  
- BI: Looker Studio (planned)  
- Version Control: GitHub  

---

## Data Source

BigQuery Public Dataset:  
`bigquery-public-data.google_analytics_sample`

Tables:
- `ga_sessions_*` (Google Analytics 360 sample data)

---

## Warehouse Layers

### Raw Layer
- `raw_ga_sessions_all` (BigQuery VIEW)
- 903,653 rows
- 714,167 users
- 886,303 sessions
- 11,552 transactions
- Revenue: £1.65M (transaction-level)

### Staging Layer
- `stg_sessions`
- `stg_hits`
- `stg_products`
- `stg_transactions` (deduplicated by transaction_id)

Includes full data quality checks and revenue reconciliation.

### Analytics Warehouse (Kimball Model)

Dimensions:
- `dim_date`
- `dim_channel`
- `dim_device`
- `dim_geo`
- `dim_user`
- `dim_product`

Facts:
- `fact_sessions`
- `fact_events`
- `fact_orders`

---

## KPIs

- Sessions
- Users
- Conversion Rate
- Funnel Step Conversion
- Orders
- Revenue
- Average Order Value (AOV)
- Revenue per Session
- Channel Attribution Performance
- Product Performance
- Geo & Device Conversion

---

## Repo Structure

web-analytics-funnel/
├── sql/
│ ├── raw/
│ ├── staging/
│ ├── model/
│ └── marts/
├── scripts/
├── dashboards/
│ └── screenshots/
├── docs/
├── data/
├── notebooks/
├── config/
├── requirements.txt
└── README.md


---

## Current Status

Stage 2 — Raw ingestion ✔  
Stage 3 — Data quality & staging ✔  
Stage 4 — Analytics warehouse modelling ✔  

Next:
- KPI marts
- Executive dashboard
- Insight write-up

---

## Author

Finnbarr Ambrose  
Analytics Engineering Portfolio Project
