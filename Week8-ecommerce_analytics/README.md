# Week 8 – E-Commerce Order Analytics System

## Overview

This project demonstrates an end-to-end **E-Commerce Order Analytics System** built using **Python, Pandas, SQLite, and SQL**. The workflow covers the complete data pipeline, including synthetic data generation, data cleaning, SQL-based business analysis, Python-SQL integration, and edge case validation.

The objective is to simulate a real-world analytics workflow by preparing clean, relational datasets, storing them in a SQLite database, and extracting meaningful business insights through SQL queries and automated reporting.

---

## Technologies Used

* Python
* Pandas
* SQLite
* SQL
* Jupyter Notebook

---

## Project Structure

```text
Week8-ecommerce_analytics/
│
├── README.md
│
├── Data Generation
│   └── data/
│       └── raw_data/
│           ├── customers.csv
│           ├── orders.csv
│           ├── order_items.csv
│           └── products.csv
│
├── Data Cleaning
│   ├── cleaning_data.py
│   └── data/
│       └── cleaned/
│           ├── customers.csv
│           ├── orders.csv
│           ├── order_items.csv
│           └── products.csv
│
├── SQL Analysis
│   ├── sql-queries/
│   │   ├── basic_queries.sql
│   │   ├── intermediate_queries.sql
│   │   └── advanced_queries.sql
│   │
│   └── sql-queries-outputs/
│       ├── basic_queries/
│       ├── intermediate_queries/
│       └── advanced_queries/
│
├── Python + SQL Integration
│   ├── create_database_for_report.py
│   ├── report_generator.py
│   ├── report_generator-output.png
│   └── database/
│       ├── ecommerce.db
│       └── schema.sql
│
└── Edge Case Handling
    ├── Edge_cases_check.py
    └── Edge_cases_check-output.png
```

---

## Workflow

### 1. Data Generation

* Generated realistic e-commerce datasets.
* Included intentional inconsistencies to simulate real-world data quality issues.
* Created relational datasets for customers, orders, products, and order items.

### 2. Data Cleaning

* Cleaned and standardized all datasets using Pandas.
* Validated email addresses.
* Corrected inconsistent date formats.
* Normalized product names.
* Removed duplicates and handled missing values where necessary.
* Verified referential integrity between related tables.

### 3. SQL Analysis

Performed SQL analysis at multiple levels:

* Basic queries for filtering and aggregation.
* Intermediate queries using joins and grouping.
* Advanced queries involving multiple joins, ranking, and analytical business insights.

### 4. Python + SQL Integration

* Created a SQLite database from the cleaned datasets.
* Loaded data into relational tables.
* Developed a Python-based report generator to automate business reporting.

### 5. Edge Case Handling

Validated common data quality issues including:

* Invalid Order IDs
* Incorrect discount values
* Zero-quantity order items
* Future order dates
* Other integrity checks

---

## How to Run

### Step 1: Clean the datasets

```bash
python cleaning_data.py
```

### Step 2: Create the SQLite database

```bash
python create_database_for_report.py
```

### Step 3: Generate analytical reports

```bash
python report_generator.py
```

### Step 4: Execute edge case validation

```bash
python Edge_cases_check.py
```

---

## Learning Outcomes

Through this project, the following concepts were implemented and practiced:

* Synthetic Data Generation
* Data Cleaning using Pandas
* Relational Database Design
* SQLite Database Management
* SQL Query Writing (Basic, Intermediate, and Advanced)
* Python and SQL Integration
* Business Report Automation
* Data Validation and Edge Case Testing

---


