import pandas as pd

# Load Data
df = pd.read_csv("Output/building_energy_featured.csv")

# Mean and Std
mean = df["Energy_Usage_kWh"].mean()
std = df["Energy_Usage_kWh"].std()

# Z-Score
df["Z_Score"] = (df["Energy_Usage_kWh"] - mean) / std

# Detect anomalies
anomalies = df[abs(df["Z_Score"]) > 3]

# Save anomalies
anomalies.to_csv("Output/anomalies.csv", index=False)

print("Total Anomalies Found:", len(anomalies))