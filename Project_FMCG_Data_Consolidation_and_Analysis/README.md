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

  

| Technology | Purpose                                                                                |
|------------|---------                                                                               |
| Databricks | Cloud-based data engineering platform for building and orchestrating the data pipeline |
| PySpark    | Distributed data processing, cleaning, and transformations    |
| Delta Lake | ACID-compliant Lakehouse storage and incremental data processing |
| SQL        | Analytical queries and business insights |
| Power BI   | Dashboard creation and business visualization |
| Git        | Version control |
| GitHub     | Source code hosting and project collaboration |
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

# Solution Architecture

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

**Note: Display statements were commented out before exporting the notebooks to reduce notebook size and improve GitHub readability. The transformation logic remains unchanged.**

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


```text
Project_FMCG_Data_Consolidation_and_Analysis/

├── architecture.png
├── README.md
├── Documentation/
│
├── data/
│   ├── 01_bronze/
│   │   ├── historical/
│   │   │   ├── company_A/
│   │   │   │   ├── customers_A.csv
│   │   │   │   ├── products_A.csv
│   │   │   │   ├── orders_A.csv
│   │   │   │   └── stores_A.csv
│   │   │   │
│   │   │   └── company_B/
│   │   │       ├── customers_B.csv
│   │   │       ├── products_B.csv
│   │   │       ├── orders_B.csv
│   │   │       └── stores_B.csv
│   │   │
│   │   └── incremental/
│   │       └── orders_incremental_01.csv
│   │
│   ├── 02_silver/
│   │   ├── silver_before_increment (historical)/
│   │   │   ├── customers.csv
│   │   │   ├── products.csv
│   │   │   ├── stores.csv
│   │   │   └── orders.csv
│   │   │
│   │   └── silver_after_increment/
│   │       ├── customers.csv
│   │       ├── products.csv
│   │       ├── stores.csv
│   │       └── orders.csv
│   │
│   └── 03_gold/
│       ├── gold_before_increment/
│       │   ├── dim_customers.csv
│       │   ├── dim_products.csv
│       │   ├── dim_stores.csv
│       │   ├── dim_time.csv
│       │   └── fact_sales.csv
│       │
│       └── gold_after_increment/
│           ├── dim_customers.csv
│           ├── dim_products.csv
│           ├── dim_stores.csv
│           ├── dim_time.csv
│           └── fact_sales.csv
│
├── notebooks/
│   ├── 00_customers_generation_for_companyA.ipynb
│   ├── 01_Bronze_Layer.ipynb
│   ├── 02_Silver_Layer_1.ipynb
│   ├── 03_Silver_Layer_2.ipynb
│   ├── 04_Gold_Layer.ipynb
│   └── 05_Incremental_Load.ipynb
│
├── orchestration/
│   ├── job_running.png
│   ├── job_scheduled.png
│   └── job_successful_ran.png
│
├── power_bi/
│   ├── dashboard_01.png
│   ├── dashboard_02.png
│   └── Fmcg_dashboard.pbix
│
└── SQL_Analysis/
    ├── SQL_Analysis.ipynb
    └── outputs/
        

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
