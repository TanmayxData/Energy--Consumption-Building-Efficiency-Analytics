import pandas as pd

# Load Data
df = pd.read_csv("Output/building_energy_featured.csv")

# Monthly Energy
monthly = df.groupby("Month")["Energy_Usage_kWh"].sum()
print("\nMonthly Energy Consumption")
print(monthly)

# Building Type Analysis
building = df.groupby("Building_Type")["Energy_Usage_kWh"].sum()
print("\nBuilding Type Consumption")
print(building)

# Occupancy Analysis
occupancy = df.groupby("Occupancy_Level")["Energy_Usage_kWh"].mean()
print("\nOccupancy vs Energy Usage")
print(occupancy)

# Temperature Analysis
temp = df.groupby("Temperature_Bin")["Energy_Usage_kWh"].mean()
print("\nTemperature vs Energy Usage")
print(temp)

# Season Analysis
season = df.groupby("Season")["Energy_Usage_kWh"].mean()
print("\nSeason-wise Energy Usage")
print(season)

# Save Summary
monthly.to_csv("output/monthly_energy_summary.csv")

print("\nAnalysis Completed")