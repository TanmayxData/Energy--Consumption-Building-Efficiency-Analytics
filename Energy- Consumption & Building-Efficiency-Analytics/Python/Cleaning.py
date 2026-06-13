import pandas as pd

# Load Dataset
df = pd.read_csv("Dataset/building_energy.csv", encoding="latin1")

# Rename All Columns
df.columns = [
    "Timestamp",
    "Building_ID",  
    "Energy_Usage_kWh",
    "Temperature_C",
    "Humidity_Percent",
    "Building_Type",
    "Occupancy_Level"
]

# Remove Duplicates
df.drop_duplicates(inplace=True)

# Fill Missing Numeric Values
numeric_columns = [
    "Energy_Usage_kWh",
    "Temperature_C",
    "Humidity_Percent"
]
for col in numeric_columns:
    df[col] = df[col].fillna(df[col].mean())

# Fill Missing Categorical Values
df["Building_Type"] = df["Building_Type"].fillna("Unknown")
df["Occupancy_Level"] = df["Occupancy_Level"].fillna("Unknown")

# Convert Timestamp
df["Timestamp"] = df["Timestamp"].str.replace(".00", ":00", regex=False)

df["Timestamp"] = pd.to_datetime(df["Timestamp"], format="%d-%m-%Y %H:%M")


df.reset_index(drop=True, inplace=True)


df.to_csv("Output/building_energy_cleaned.csv",index=False)

print("Cleaning Completed.")
print("Total Records:", len(df))