import pandas as pd
from sqlalchemy import create_engine

engine = create_engine(
    "postgresql+psycopg2://postgres:22486452@localhost:5432/bluestock_mf"
)

files = {
    "clean_fund_master.csv": "dim_fund",
    "clean_nav_history.csv": "fact_nav",
    "clean_investor_transactions.csv": "fact_transactions",
    "clean_scheme_performance.csv": "fact_performance",
    "clean_aum_by_fund_house.csv": "fact_aum_by_fund_house",
    "clean_monthly_sip_inflows.csv": "fact_monthly_sip_inflows",
    "clean_category_inflows.csv": "fact_category_inflows",
    "clean_industry_folio_count.csv": "fact_industry_folio_count",
    "clean_portfolio_holdings.csv": "fact_portfolio_holdings",
    "clean_benchmark_indices.csv": "fact_benchmark_indices"
}

for file, table in files.items():

    print(f"Loading {table}...")

    df = pd.read_csv(
        fr"D:\bluestock_mf_capstone\data\processed\{file}"
    )

    df.to_sql(
        table,
        engine,
        if_exists="append",
        index=False
    )

    print(f"{table} loaded successfully")