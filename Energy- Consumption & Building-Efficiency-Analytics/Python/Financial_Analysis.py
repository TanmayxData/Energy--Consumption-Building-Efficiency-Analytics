import pandas as pd

# Load Data
df = pd.read_csv("Output/building_energy_featured.csv")

# Assume electricity rate
RATE_PER_KWH = 8  # ₹ per kWh

# Cost Calculation
df["Energy_Cost"] = df["Energy_Usage_kWh"] * RATE_PER_KWH

# Total Cost
total_cost = df["Energy_Cost"].sum()
print("\nTotal Energy Cost:", total_cost)

# Building-wise Cost
building_cost = df.groupby("Building_ID")["Energy_Cost"].sum()
print("\nTop 5 High Cost Buildings")
print(building_cost.sort_values(ascending=False).head())

# Monthly Cost
monthly_cost = df.groupby("Month")["Energy_Cost"].sum()
print("\nMonthly Cost")
print(monthly_cost)
 
 
df.to_csv("output/final_with_cost.csv", index=False)
monthly_cost.to_csv("output/monthly_cost.csv")

print("\nFinancial Analysis Completed")