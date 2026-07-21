\# FMCG Data Consolidation \& Analytics Platform 



\## Project Overview



This project demonstrates an end-to-end cloud data engineering pipeline built using \*\*Databricks\*\*, \*\*Delta Lake\*\*, \*\*PySpark\*\*, \*\*SQL\*\*, and \*\*Power BI\*\* following the \*\*Medallion Architecture (Bronze → Silver → Gold)\*\*.



The project simulates a real-world business acquisition scenario where \*\*Company A acquires Company B\*\*. Both companies maintain separate datasets with different schemas, requiring schema harmonization, data cleaning, data consolidation, and analytical modeling before business reporting.



The pipeline also demonstrates \*\*incremental data loading\*\* using Delta Lake MERGE operations and automated orchestration through \*\*Databricks Workflows\*\*.



\---



\# Objectives



\- Simulate heterogeneous enterprise datasets

\- Build a Medallion Architecture using Delta Lake

\- Perform schema harmonization between multiple source systems

\- Clean and standardize enterprise datasets

\- Create analytical Gold tables using a Star Schema

\- Implement incremental data ingestion

\- Automate pipeline execution using Databricks Workflows

\- Visualize business insights using Power BI



\---



\# Technology Stack



| Technology | Purpose |

|------------|---------|

| Databricks | Data Engineering Platform |

| PySpark    | Data Processing |

| Delta Lake | Lakehouse Storage |

| SQL        | Business Analysis |

| Power BI   | Dashboard \& Reporting |

| Git,GitHub | Version Control |



\---



\# Dataset Description



Two independent source systems were created to simulate an acquisition scenario.



\### Company A



\- Customers

\- Products

\- Stores

\- Orders



\### Company B



\- Customers

\- Products

\- Stores

\- Orders



The datasets intentionally contain:



\- Schema differences

\- Duplicate records

\- Missing values

\- Inconsistent formatting

\- Mixed customer identifier formats

\- Negative quantities (Orders)

\- Inconsistent payment modes



These simulate real-world enterprise data quality challenges before consolidation.



\---



\# Project Architecture



```

&#x20;               Company A

&#x20;                   │

&#x20;               Company B

&#x20;                   │

&#x20;         Historical CSV Files

&#x20;                   │

&#x20;               Bronze Layer

&#x20;       (Raw Delta Tables)

&#x20;                   │

&#x20;               Silver Layer

(Data Cleaning + Harmonization + Consolidation)

&#x20;                   │

&#x20;               Gold Layer

&#x20;    (Star Schema + Analytics)

&#x20;                   │

&#x20;         SQL Analysis \& Power BI

```



\---



\# Medallion Architecture



\## Bronze Layer



\- Ingested raw CSV datasets into Delta tables

\- Preserved original data

\- No transformations performed



\---



\## Silver Layer



\- Cleaned and standardized datasets

\- Harmonized schemas between Company A and Company B

\- Removed duplicates and applied business rules

\- Consolidated data into unified Silver tables



\---



\# Gold Layer



The Gold layer follows a \*\*Star Schema\*\*.



\### Dimension Tables



\- dim\_customers

\- dim\_products

\- dim\_stores

\- dim\_time



\### Fact Table



\- fact\_sales



Sales Amount is calculated using:



```

Quantity × Unit Price × (1 − Discount)

```



The Time Dimension enables analysis by:



\- Day

\- Week

\- Month

\- Quarter

\- Year



\---



\# Incremental Data Pipeline



After the historical load, new transactional data is processed using an incremental pipeline.



Pipeline steps:



1\. Read incremental CSV

2\. Load raw data into Bronze

3\. Apply Silver cleaning/standardising rules

4\. Perform Delta Lake MERGE

5\. Refresh Gold tables

6\. Refresh Power BI



This simulates production ETL where only new or updated records are processed instead of reloading the complete dataset.



\---



\# Workflow Orchestration



Databricks Workflows automate the pipeline.



```

Incremental\_Load

&#x20;       │

&#x20;       ▼

Refresh\_Gold\_Layer

```



The second task executes only after the incremental load completes successfully.



\---



\# SQL Analysis



A separate SQL notebook demonstrates analytical queries on the Gold Layer, including:



\- Revenue analysis

\- Sales trends

\- Product performance

\- Customer insights

\- Regional performance



\---



\# Power BI Dashboard



The Power BI dashboard is built using the Gold Layer tables generated before incremental loading.



Visualizations include:



\- Total Sales

\- Revenue by Category

\- Sales by Region

\- Yearly Sales Trend

\- Top Products

\- Customer Insights



For this project, Gold tables were exported as CSV files and imported into Power BI using Power Query. In a production environment, Power BI can connect directly to Databricks. 

\---



\# Repository Structure



```

FMCG-Data-Consolidation-Analytics/



├── data

│   ├── 01\_bronze

│   │   ├── historical

│   │   │   ├── company\_A

│   │   │   └── company\_B

│   │   └── incremental

│   │

│   ├── 02\_silver

│   │   ├── silver\_before\_increment(historical)

│   │   └── silver\_after\_increment

│   │

│   └── 03\_gold

│       ├── gold\_before\_increment

│       └── gold\_after\_increment

│

├── notebooks

│   ├── 00\_customers\_generation\_for\_companyA.ipynb

│   ├── 01\_Bronze\_Layer.ipynb

│   ├── 02\_Silver\_Layer\_1.ipynb

│   ├── 03\_Silver\_Layer\_2.ipynb

│   ├── 04\_Gold\_Layer.ipynb

│   └── 05\_Incremental\_Load.ipynb

│

├── orchestration

│

├── power\_bi

│

├── SQL\_Analysis

│

├── architecture.png

└── README.md

|\_\_\_ Documentation/



```



\---



\# How to Run



Download the initial (historical) datasets of company A and company B.



1\. Execute Bronze Layer notebook.

2\. Execute Silver Layer notebooks.

3\. Execute Gold Layer notebook.

4\. Run SQL analysis notebook.

5\. Open the Power BI dashboard. (gold\_tables before increment are used)

6\. To simulate new data arrival, execute the Incremental Load notebook or run the Databricks Workflow.



\---



\# Key Learnings



\- Lakehouse Architecture

\- Delta Lake

\- Medallion Architecture

\- Schema Harmonization

\- Data Cleaning

\- Incremental ETL

\- Delta MERGE

\- Star Schema Design

\- Databricks Workflows

\- Power BI Reporting



\---



\# Future Improvements



\- Real-time streaming using Auto Loader

\- Direct Power BI connectivity with Databricks

\- CI/CD pipeline integration

\- Data quality monitoring

\- Automated testing and alerting

\- Slowly Changing Dimensions (SCD)



\---



