import pandas as pd

fund_scorecard = pd.read_csv(
    "../data/processed/fund_scorecard.csv"
)

fund_scorecard["risk_grade"] = pd.qcut(
    fund_scorecard["std_dev_ann_pct"],
    q=3,
    labels=["Low","Moderate","High"]
)

def recommend_funds(risk_level):

    recommendations = (
        fund_scorecard[
            fund_scorecard["risk_grade"] == risk_level
        ]
        .sort_values(
            "sharpe_ratio",
            ascending=False
        )
        .head(3)
    )

    return recommendations