-- Query 1: Top 5 Funds by AUM

SELECT scheme_name,aum_crore
FROM fact_performance
ORDER BY aum_crore DESC
LIMIT 5;

-- Query 2: Average NAV Per Month

SELECT DATE_TRUNC('month', date) AS month,
ROUND(AVG(nav), 2) AS avg_nav
FROM fact_nav
GROUP BY month
ORDER BY month;

-- Query 3: SIP Inflow YoY Growth

SELECT month,sip_inflow_crore,yoy_growth_pct
FROM fact_monthly_sip_inflows
WHERE yoy_growth_pct IS NOT NULL
ORDER BY month;

-- Query 4: Transactions By State

SELECT state,COUNT(*) AS transaction_count,ROUND(SUM(amount_inr),2) AS total_amount
FROM fact_transactions
GROUP BY state
ORDER BY total_amount DESC;

-- Query 5: Funds With Expense Ratio < 1%

SELECT scheme_name,expense_ratio_pct
FROM fact_performance
WHERE expense_ratio_pct < 1
ORDER BY expense_ratio_pct;

-- Query 6: Top 5 Funds by Sharpe Ratio

SELECT scheme_name,sharpe_ratio
FROM fact_performance
ORDER BY sharpe_ratio DESC
LIMIT 5;

-- Query 7: Average Return by Category

SELECT category,
ROUND(AVG(return_3yr_pct),2) AS avg_return
FROM fact_performance
GROUP BY category
ORDER BY avg_return DESC;

-- Query 8: KYC Status Distribution

SELECT kyc_status,
COUNT(*) AS investors
FROM fact_transactions
GROUP BY kyc_status;

-- Query 9: Risk Grade Distribution

SELECT risk_grade,COUNT(*) AS funds
FROM fact_performance
GROUP BY risk_grade
ORDER BY funds DESC;

-- Query 10: Fund House Wise Fund Count

SELECT fund_house,
COUNT(*) AS total_funds
FROM dim_fund
GROUP BY fund_house
ORDER BY total_funds DESC;