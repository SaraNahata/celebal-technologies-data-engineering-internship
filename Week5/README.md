# Week 5 - PySpark DataFrame Operations

## Overview
This folder contains the solutions for the Week 5 PySpark assignment. The notebook demonstrates various DataFrame operations such as filtering, aggregation, data cleaning, type conversion, and grouping using PySpark.

## Folder Structure

```
.
├── data/
│   ├── sample_dataset.csv
│   └── store_sales_small.csv
├── notebook(with outputs)/
│   └── WEEK5.ipynb
└── README.md
```

## Topics Covered

- Reading CSV files into PySpark DataFrames
- Schema inference
- Filtering records
- Grouping and aggregation
- Handling null values
- Removing duplicate records
- Casting data types
- Renaming columns
- Data cleaning operations
- Revenue calculation using aggregation

## Datasets Used

### sample data mentioned in notebook
Used for (Q3-Q5): 
- Removing duplicate records
- Filtering 
- Filling null values

### sample_dataset.csv
Used for (Q6,8,9,12):
- Grouping records by city
- Filtering Premium subscribers aged 18–30
- Timestamp conversion
- Removing invalid records

### store_sales_small.csv
Used for (Q13,15):
- Aggregation using `.agg()`
- Duplicate removal
- Filling null values
- Revenue calculation by store

## Technologies

- Python
- Apache Spark (PySpark)
- Google Colab / Jupyter Notebook

## Output

The notebook contains code along with outputs demonstrating the required DataFrame transformations and aggregations.