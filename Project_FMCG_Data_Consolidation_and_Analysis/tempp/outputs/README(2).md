# FMCG Data Consolidation & Analytics Platform

## Project Overview

This project demonstrates an end-to-end cloud data engineering pipeline
built using **Databricks**, **Delta Lake**, **PySpark**, **SQL**, and
**Power BI** following the **Medallion Architecture (Bronze → Silver →
Gold)**.

The project simulates a real-world business acquisition scenario where
**Company A acquires Company B**. Both companies maintain separate
datasets with different schemas, requiring schema harmonization, data
cleaning, data consolidation, and analytical modeling before business
reporting.

The pipeline also demonstrates **incremental data loading** using Delta
Lake MERGE operations and automated orchestration through **Databricks
Workflows**.

------------------------------------------------------------------------

# Objectives

-   Simulate heterogeneous enterprise datasets
-   Build a Medallion Architecture using Delta Lake
-   Perform schema harmonization between multiple source systems
-   Clean and standardize enterprise datasets
-   Create analytical Gold tables using a Star Schema
-   Implement incremental data ingestion
-   Automate pipeline execution using Databricks Workflows
-   Visualize business insights using Power BI

------------------------------------------------------------------------

# Technology Stack

  Technology     Purpose
  -------------- ---------------------------------------
  Databricks     Data Engineering Platform
  PySpark        Distributed Data Processing
  Delta Lake     Lakehouse Storage & ACID Transactions
  SQL            Analytical Queries
  Power BI       Dashboard & Data Visualization
  Git & GitHub   Version Control

------------------------------------------------------------------------

# Dataset Description

Two independent source systems were created to simulate an acquisition
scenario.

### Company A

-   Customers
-   Products
-   Stores
-   Orders

### Company B

-   Customers
-   Products
-   Stores
-   Orders

The datasets intentionally contain:

-   Schema differences
-   Duplicate records
-   Missing values
-   Inconsistent formatting
-   Mixed customer identifier formats
-   Negative quantities (Orders)
-   Inconsistent payment modes

These simulate real-world enterprise data quality challenges before
consolidation.

------------------------------------------------------------------------

# Project Architecture

``` text
                Company A
                    │
                Company B
                    │
          Historical CSV Files
                    │
                Bronze Layer
        (Raw Delta Tables)
                    │
                Silver Layer
(Data Cleaning + Harmonization + Consolidation)
                    │
                Gold Layer
     (Star Schema + Analytics)
                    │
          SQL Analysis & Power BI
```

------------------------------------------------------------------------

# Medallion Architecture

## Bronze Layer

-   Ingested raw CSV datasets into Delta tables
-   Preserved original data
-   No transformations performed

## Silver Layer

-   Cleaned and standardized datasets
-   Harmonized schemas between Company A and Company B
-   Removed duplicates and applied business rules
-   Consolidated data into unified Silver tables

## Gold Layer

-   Built Star Schema consisting of `fact_sales`, `dim_customers`,
    `dim_products`, `dim_stores`, and `dim_time`
-   Sales Amount = Quantity × Unit Price × (1 − Discount)
-   Supports analysis by day, week, month, quarter, and year

------------------------------------------------------------------------

# Incremental Data Pipeline

1.  Read incremental CSV
2.  Load raw data into Bronze
3.  Apply Silver cleaning and standardization rules
4.  Perform Delta Lake MERGE
5.  Refresh Gold tables
6.  Refresh Power BI

Only new or updated records are processed instead of reloading the
complete dataset.

------------------------------------------------------------------------

# Workflow Orchestration

``` text
Incremental_Load
        │
        ▼
Refresh_Gold_Layer
```

------------------------------------------------------------------------

# SQL Analysis

-   Revenue analysis
-   Sales trends
-   Product performance
-   Customer insights
-   Regional performance

------------------------------------------------------------------------

# Power BI Dashboard

The Power BI dashboard is built using the **Gold Layer generated before
incremental loading**.

Visualizations include Total Sales, Revenue by Category, Sales by
Region, Yearly Sales Trend, Top Products, and Customer Insights.

------------------------------------------------------------------------

# Repository Structure

``` text
Project_FMCG_Data_Consolidation_and_Analysis/

├── data
│   ├── 01_bronze
│   ├── 02_silver
│   └── 03_gold
├── notebooks
├── orchestration
├── power_bi
├── SQL_Analysis
├── Documentation
├── architecture.png
└── README.md
```

------------------------------------------------------------------------

# How to Run

1.  Download the historical datasets.
2.  Run Bronze Layer.
3.  Run both Silver Layer notebooks.
4.  Run Gold Layer.
5.  Run SQL Analysis.
6.  Open the Power BI dashboard (built using the Gold tables before
    incremental loading).
7.  Execute the Incremental Load notebook or the Databricks Workflow to
    process new data.

------------------------------------------------------------------------

# Key Learnings

-   Lakehouse Architecture
-   Delta Lake
-   Medallion Architecture
-   Schema Harmonization
-   Incremental ETL
-   Delta MERGE
-   Databricks Workflows
-   Star Schema Design
-   Power BI Reporting

------------------------------------------------------------------------

# Future Improvements

-   Real-time ingestion using Auto Loader
-   Direct Power BI connectivity with Databricks
-   CI/CD pipeline integration
-   Data quality monitoring
-   Slowly Changing Dimensions (SCD)
