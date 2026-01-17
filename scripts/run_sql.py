from __future__ import annotations

from google.cloud import bigquery
import pathlib

PROJECT_ID = "web-analytics-funnel"


def run_sql(client: bigquery.Client, file_path: str):
    sql = pathlib.Path(file_path).read_text(encoding="utf-8")
    job = client.query(sql)
    result = job.result()
    print(f"\nExecuted: {file_path}")
    return result


def print_result_rows(result, title: str):
    print(f"\n{title}")
    for row in result:
        for k, v in dict(row).items():
            print(f"{k}: {v}")


if __name__ == "__main__":
    client = bigquery.Client(project=PROJECT_ID)

        # ---------- RAW (VIEW) ----------
    run_sql(client, "sql/raw/00_drop_raw_table_if_exists.sql")
    run_sql(client, "sql/raw/01_create_raw_table.sql")
    raw_validation = run_sql(client, "sql/raw/02_validate_raw_load.sql")
    print_result_rows(raw_validation, "Raw Load Validation:")


    # ---------- STAGING ----------
    run_sql(client, "sql/staging/01_stg_sessions.sql")
    run_sql(client, "sql/staging/02_stg_hits.sql")
    run_sql(client, "sql/staging/03_stg_products.sql")
    run_sql(client, "sql/staging/04_stg_transactions.sql")

    quality_checks = run_sql(client, "sql/staging/99_quality_checks.sql")
    print_result_rows(quality_checks, "Stage 3 Quality Checks:")

