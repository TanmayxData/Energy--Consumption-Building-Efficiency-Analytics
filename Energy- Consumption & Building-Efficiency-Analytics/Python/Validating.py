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

print("========== DATA VALIDATION REPORT ==========\n")

# Total Records
print("Total Records:", len(df))

# Missing Values
print("\nMissing Values:")
print(df.isnull().sum())

# Duplicate Records
duplicates = df.duplicated().sum()
print("\nDuplicate Records:", duplicates)

# Negative Energy Usage
negative_energy = (df["Energy_Usage_kWh"] < 0).sum()
print("Negative Energy Records:", negative_energy)

# Invalid Humidity
invalid_humidity = ((df["Humidity_Percent"] < 0) | (df["Humidity_Percent"] > 100)).sum()

print("Invalid Humidity Records:", invalid_humidity)

# Unique Building Types
print("\nBuilding Types:")
print(df["Building_Type"].unique())

# Unique Occupancy Levels
print("\nOccupancy Levels:")
print(df["Occupancy_Level"].unique())

# Save Validation Report
validation_report = pd.DataFrame({
    "Check": [
        "Total Records",
        "Duplicate Records",
        "Negative Energy Records",
        "Invalid Humidity Records"
    ],
    "Value": [
        len(df),
        duplicates,
        negative_energy,
        invalid_humidity
    ]
})

validation_report.to_csv("Output/validation_report.csv",index=False)

print("\nValidation Report Saved.")