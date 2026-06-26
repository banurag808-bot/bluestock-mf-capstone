clean_aum_by_fund_house


-- clean_aum_by_fund_house
-- =====================================================
CREATE TABLE clean_aum_by_fund_house (
    date DATE,
    fund_house VARCHAR(200),
    aum_lakh_crore NUMERIC(12,4),
    aum_crore NUMERIC(18,2),
    num_schemes INTEGER
);

-- =====================================================
-- clean_benchmark_indices
-- =====================================================
CREATE TABLE clean_benchmark_indices (
    date DATE,
    index_name VARCHAR(200),
    close_value NUMERIC(12,4)
);

-- =====================================================
-- clean_category_inflows
-- =====================================================
CREATE TABLE clean_category_inflows (
    month DATE,
    category VARCHAR(100),
    net_inflow_crore NUMERIC(15,2)
);

-- =====================================================
-- clean_fund_master
-- =====================================================
CREATE TABLE clean_fund_master (
    amfi_code BIGINT PRIMARY KEY,
    fund_house VARCHAR(200),
    scheme_name VARCHAR(300),
    category VARCHAR(100),
    sub_category VARCHAR(150),
    plan VARCHAR(50),
    launch_date DATE,
    benchmark VARCHAR(200),
    expense_ratio_pct NUMERIC(6,3),
    exit_load_pct NUMERIC(6,3),
    min_sip_amount NUMERIC(12,2),
    min_lumpsum_amount NUMERIC(12,2),
    fund_manager VARCHAR(200),
    risk_category VARCHAR(50),
    sebi_category_code VARCHAR(50)
);

-- =====================================================
-- clean_industry_folio_count
-- =====================================================
CREATE TABLE clean_industry_folio_count (
    month DATE,
    total_folios_crore NUMERIC(10,2),
    equity_folios_crore NUMERIC(10,2),
    debt_folios_crore NUMERIC(10,2),
    hybrid_folios_crore NUMERIC(10,2),
    others_folios_crore NUMERIC(10,2)
);

-- =====================================================
-- clean_investor_transactions
-- =====================================================
CREATE TABLE clean_investor_transactions (
    investor_id BIGINT,
    transaction_date DATE,
    amfi_code BIGINT,
    transaction_type VARCHAR(20),
    amount_inr NUMERIC(15,2),
    state VARCHAR(100),
    city VARCHAR(100),
    city_tier VARCHAR(20),
    age_group VARCHAR(30),
    gender VARCHAR(20),
    annual_income_lakh NUMERIC(10,2),
    payment_mode VARCHAR(50),
    kyc_status VARCHAR(20)
);

-- =====================================================
-- clean_monthly_sip_inflows
-- =====================================================
CREATE TABLE clean_monthly_sip_inflows (
    month DATE,
    sip_inflow_crore NUMERIC(15,2),
    active_sip_accounts_crore NUMERIC(10,2),
    new_sip_accounts_lakh NUMERIC(10,2),
    sip_aum_lakh_crore NUMERIC(10,2),
    yoy_growth_pct NUMERIC(6,2)
);

-- =====================================================
-- clean_nav_history
-- =====================================================
CREATE TABLE clean_nav_history (
    amfi_code BIGINT,
    date DATE,
    nav NUMERIC(12,4),
    daily_return NUMERIC(10,6),
    PRIMARY KEY(amfi_code, date)
);

-- =====================================================
-- clean_portfolio_holdings
-- =====================================================
CREATE TABLE clean_portfolio_holdings (
    amfi_code BIGINT,
    stock_symbol VARCHAR(20),
    stock_name VARCHAR(200),
    sector VARCHAR(100),
    weight_pct NUMERIC(8,4),
    market_value_cr NUMERIC(15,2),
    current_price_inr NUMERIC(12,2),
    portfolio_date DATE
);

-- =====================================================
-- clean_scheme_performance
-- =====================================================
CREATE TABLE clean_scheme_performance (
    amfi_code BIGINT PRIMARY KEY,
    scheme_name VARCHAR(300),
    fund_house VARCHAR(200),
    category VARCHAR(100),
    plan VARCHAR(50),
    return_1yr_pct NUMERIC(8,4),
    return_3yr_pct NUMERIC(8,4),
    return_5yr_pct NUMERIC(8,4),
    benchmark_3yr_pct NUMERIC(8,4),
    alpha NUMERIC(10,4),
    beta NUMERIC(10,4),
    sharpe_ratio NUMERIC(10,4),
    sortino_ratio NUMERIC(10,4),
    std_dev_ann_pct NUMERIC(10,4),
    max_drawdown_pct NUMERIC(10,4),
    aum_crore NUMERIC(18,2),
    expense_ratio_pct NUMERIC(8,4),
    morningstar_rating INTEGER,
    risk_grade VARCHAR(30)
);

