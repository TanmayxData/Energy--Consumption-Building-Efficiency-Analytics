import pandas as pd

# Load Clean Data
df = pd.read_csv("Output/building_energy_cleaned.csv")

# Convert Timestamp
df["Timestamp"] = pd.to_datetime(df["Timestamp"])

# Time Features
df["Year"] = df["Timestamp"].dt.year
df["Month"] = df["Timestamp"].dt.month
df["Day"] = df["Timestamp"].dt.day
df["Hour"] = df["Timestamp"].dt.hour
df["Weekday"] = df["Timestamp"].dt.day_name()

# Season Feature
def get_season(month):
    if month in [12, 1, 2]:
        return "Winter"
    elif month in [3, 4, 5]:
        return "Summer"
    elif month in [6, 7, 8]:
        return "Monsoon"
    else:
        return "Post-Monsoon"

df["Season"] = df["Month"].apply(get_season)

# Temperature Binning
def temp_bin(temp):
    if temp < 10:
        return "Very Cold"
    elif temp < 20:
        return "Cold"
    elif temp < 30:
        return "Moderate"
    else:
        return "Hot"

df["Temperature_Bin"] = df["Temperature_C"].apply(temp_bin)

# Save
df.to_csv("Output/building_energy_featured.csv", index=False)

print("Feature Engineering Completed")