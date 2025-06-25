import pandas as pd

# Sample datetime series in %d/%m/%Y format
datetime_series = pd.Series(['22/02/2024', '23/02/2024', '24/02/2024'])

# Convert to timestamp
timestamp_series = pd.to_datetime(datetime_series, format='%d/%m/%Y')

print(timestamp_series)


timestamp_series = pd.to_datetime(datetime_series, format='%d/%m/%Y').astype('int64')

print(timestamp_series)
