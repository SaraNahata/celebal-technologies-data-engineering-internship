# Assignment 7 - Delta Lake Incremental Data Processing

## Overview
This assignment demonstrates how Delta Lake handles incremental data processing using the `MERGE` operation in PySpark.

A master dataset is first converted into Delta format. An incremental dataset containing both updated and new records is then merged into the Delta table using a single `MERGE` statement.

---

## Project Structure

```
Assignment7_DeltaLake/
│
├── data/
│   ├── Sample - Superstore.csv
│   ├── sample_superstore_incremental.csv
│   
│
├── outputs/
│   └── (Screenshots/Output files)
│
├── Assignment7_DeltaLake.ipynb
└── README.md
|___ Assignment_Report
```

---

## Technologies Used

- Python
- PySpark
- Delta Lake
- Jupyter Notebook

---

## Steps Performed

1. Load the master dataset.
2. Check for null values and duplicate records.
3. Rename columns for Delta compatibility.
4. Save the dataset in Delta format.
5. Load the incremental dataset.
6. Apply the `MERGE` operation to perform updates and inserts.
7. Validate the final Delta table.

---

## Output

- Existing records are updated.
- New records are inserted.
- Final merged data is displayed for verification.

---

## Learning Outcome

This assignment demonstrates how Delta Lake supports efficient incremental data processing by handling updates and inserts through a single `MERGE` operation while maintaining data consistency.