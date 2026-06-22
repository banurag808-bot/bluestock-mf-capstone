import pandas as pd
import os

# Folder where datasets are stored
folder_path = r"D:\bluestock_mf_capstone\data\raw"

# Get all files
files = os.listdir(folder_path)

print("DATA INGESTION STARTED")

for file in files:

    if file.endswith(".csv"):

        print("\n")
        print("=" * 50)
        print("Dataset Name:", file)

        df = pd.read_csv(folder_path + "/" + file)

        print("Shape:")
        print(df.shape)

        print("\nData Types:")
        print(df.dtypes)

        print("\nFirst 5 Rows:")
        print(df.head())

        print("\nMissing Values:")
        print(df.isnull().sum().sum())

        print("\nDuplicate Rows:")
        print(df.duplicated().sum())

fund_master = pd.read_csv("../data/raw/01_fund_master.csv")

print("\nCOLUMN NAMES")
print(fund_master.columns)

print("\n" + "="*50)
print("FUND MASTER ANALYSIS")
print("="*50)

print("\nFund Houses:")
print(fund_master["fund_house"].unique())

print("\nCategories:")
print(fund_master["category"].unique())

print("\nSub Categories:")
print(fund_master["sub_category"].unique())

print("\nRisk Categories:")
print(fund_master["risk_category"].unique())

nav_history = pd.read_csv("../data/raw/02_nav_history.csv")

master_codes = fund_master["amfi_code"]
nav_codes = nav_history["amfi_code"]

missing_codes = []

for code in master_codes:

    if code not in nav_codes.values:
        missing_codes.append(code)

print("\n" + "="*50)
print("AMFI VALIDATION")
print("="*50)

if len(missing_codes) == 0:
    print("All AMFI Codes Exist In NAV History")
else:
    print("Missing Codes:")
    print(missing_codes)