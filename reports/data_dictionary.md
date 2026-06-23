# Bluestock Mutual Fund Capstone Project

# Data Dictionary

---

# 1. dim_fund

Source: clean_fund_master.csv

| Column Name        | Data Type | Description                                |
| ------------------ | --------- | ------------------------------------------ |
| amfi_code          | BIGINT    | Unique AMFI scheme code                    |
| fund_house         | VARCHAR   | Name of mutual fund company                |
| scheme_name        | VARCHAR   | Name of mutual fund scheme                 |
| category           | VARCHAR   | Fund category                              |
| sub_category       | VARCHAR   | Fund sub-category                          |
| plan               | VARCHAR   | Direct or Regular plan                     |
| launch_date        | DATE      | Scheme launch date                         |
| benchmark          | VARCHAR   | Benchmark index used for comparison        |
| expense_ratio_pct  | NUMERIC   | Annual expense ratio percentage            |
| exit_load_pct      | NUMERIC   | Exit load percentage charged on redemption |
| min_sip_amount     | NUMERIC   | Minimum SIP investment amount              |
| min_lumpsum_amount | NUMERIC   | Minimum lump sum investment amount         |
| fund_manager       | VARCHAR   | Name of fund manager                       |
| risk_category      | VARCHAR   | Risk classification of scheme              |
| sebi_category_code | VARCHAR   | SEBI assigned category code                |

---

# 2. fact_nav

Source: clean_nav_history.csv

| Column Name | Data Type | Description               |
| ----------- | --------- | ------------------------- |
| amfi_code   | BIGINT    | Unique AMFI scheme code   |
| date        | DATE      | NAV reporting date        |
| nav         | NUMERIC   | Net Asset Value of scheme |
| daily_return| NUMERIC   | Daily percentage change in NAV compared to previous trading day |
---

# 3. fact_aum_by_fund_house

Source: clean_aum_by_fund_house.csv

| Column Name    | Data Type | Description                           |
| -------------- | --------- | ------------------------------------- |
| date           | DATE      | Reporting date                        |
| fund_house     | VARCHAR   | Name of fund house                    |
| aum_lakh_crore | NUMERIC   | Assets under management in lakh crore |
| aum_crore      | NUMERIC   | Assets under management in crore      |
| num_schemes    | INTEGER   | Number of schemes managed             |

---

# 4. fact_benchmark_indices

Source: clean_benchmark_indices.csv

| Column Name | Data Type | Description                      |
| ----------- | --------- | -------------------------------- |
| date        | DATE      | Trading date                     |
| index_name  | VARCHAR   | Benchmark index name             |
| close_value | NUMERIC   | Closing value of benchmark index |

---

# 5. fact_category_inflows

Source: clean_category_inflows.csv

| Column Name      | Data Type | Description                |
| ---------------- | --------- | -------------------------- |
| month            | DATE      | Reporting month            |
| category         | VARCHAR   | Mutual fund category       |
| net_inflow_crore | NUMERIC   | Net inflow amount in crore |

---

# 6. fact_industry_folio_count

Source: clean_industry_folio_count.csv

| Column Name         | Data Type | Description                    |
| ------------------- | --------- | ------------------------------ |
| month               | DATE      | Reporting month                |
| total_folios_crore  | NUMERIC   | Total folios in crore          |
| equity_folios_crore | NUMERIC   | Equity folios in crore         |
| debt_folios_crore   | NUMERIC   | Debt folios in crore           |
| hybrid_folios_crore | NUMERIC   | Hybrid folios in crore         |
| others_folios_crore | NUMERIC   | Other category folios in crore |

---

# 7. fact_transactions

Source: clean_investor_transactions.csv

| Column Name        | Data Type | Description                                    |
| ------------------ | --------- | ---------------------------------------------- |
| investor_id        | VARCHAR   | Unique investor identifier                     |
| transaction_date   | DATE      | Date of transaction                            |
| amfi_code          | BIGINT    | Mutual fund scheme code                        |
| transaction_type   | VARCHAR   | Type of transaction (SIP, Lumpsum, Redemption) |
| amount_inr         | NUMERIC   | Transaction amount in INR                      |
| state              | VARCHAR   | Investor state                                 |
| city               | VARCHAR   | Investor city                                  |
| city_tier          | VARCHAR   | Tier classification of city                    |
| age_group          | VARCHAR   | Investor age group                             |
| gender             | VARCHAR   | Investor gender                                |
| annual_income_lakh | NUMERIC   | Annual income in lakh rupees                   |
| payment_mode       | VARCHAR   | Mode of payment                                |
| kyc_status         | VARCHAR   | KYC verification status                        |

---

# 8. fact_monthly_sip_inflows

Source: clean_monthly_sip_inflows.csv

| Column Name               | Data Type | Description                               |
| ------------------------- | --------- | ----------------------------------------- |
| month                     | DATE      | Reporting month                           |
| sip_inflow_crore          | NUMERIC   | Monthly SIP inflow amount in crore        |
| active_sip_accounts_crore | NUMERIC   | Active SIP accounts in crore              |
| new_sip_accounts_lakh     | NUMERIC   | New SIP accounts opened in lakh           |
| sip_aum_lakh_crore        | NUMERIC   | SIP assets under management in lakh crore |
| yoy_growth_pct            | NUMERIC   | Year-over-year growth percentage          |

---

# 9. fact_portfolio_holdings

Source: clean_portfolio_holdings.csv

| Column Name       | Data Type | Description                      |
| ----------------- | --------- | -------------------------------- |
| amfi_code         | BIGINT    | Mutual fund scheme code          |
| stock_symbol      | VARCHAR   | Stock ticker symbol              |
| stock_name        | VARCHAR   | Company name                     |
| sector            | VARCHAR   | Industry sector                  |
| weight_pct        | NUMERIC   | Weight of stock in portfolio (%) |
| market_value_cr   | NUMERIC   | Market value in crore            |
| current_price_inr | NUMERIC   | Current stock price in INR       |
| portfolio_date    | DATE      | Portfolio disclosure date        |

---

# 10. fact_performance

Source: clean_scheme_performance.csv

| Column Name        | Data Type | Description                                |
| ------------------ | --------- | ------------------------------------------ |
| amfi_code          | BIGINT    | Mutual fund scheme code                    |
| scheme_name        | VARCHAR   | Name of mutual fund scheme                 |
| fund_house         | VARCHAR   | Name of fund house                         |
| category           | VARCHAR   | Fund category                              |
| plan               | VARCHAR   | Direct or Regular plan                     |
| return_1yr_pct     | NUMERIC   | One-year return percentage                 |
| return_3yr_pct     | NUMERIC   | Three-year return percentage               |
| return_5yr_pct     | NUMERIC   | Five-year return percentage                |
| benchmark_3yr_pct  | NUMERIC   | Benchmark three-year return percentage     |
| alpha              | NUMERIC   | Excess return over benchmark               |
| beta               | NUMERIC   | Sensitivity to market movements            |
| sharpe_ratio       | NUMERIC   | Risk-adjusted performance measure          |
| sortino_ratio      | NUMERIC   | Downside risk-adjusted performance measure |
| std_dev_ann_pct    | NUMERIC   | Annualized standard deviation percentage   |
| max_drawdown_pct   | NUMERIC   | Maximum observed loss from peak            |
| aum_crore          | NUMERIC   | Assets under management in crore           |
| expense_ratio_pct  | NUMERIC   | Annual expense ratio percentage            |
| morningstar_rating | INTEGER   | Morningstar rating score                   |
| risk_grade         | VARCHAR   | Risk grade classification                  |
