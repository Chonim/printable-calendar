#!/bin/bash

# Create files for each month in 2025
for i in {1..12}; do
  # Format month number to always have 2 digits
  month=$(printf "%02d" $i)
  touch "src/assets/data/2025${month}.json"
done 