# Data Engineering Internship – Celebal Technologies

This repository contains assignments, hands-on projects, and practice work completed during my Summer Internship in the Data Engineering domain at Celebal Technologies.

## Topics Covered

* Python Programming
* SQL Basics
* Subqueries
* Data Exploration and Cleaning
* Core Data Engineering Concepts
* Spark Fundamentals
* Databricks
* Data Transformation and Processing
* Workflow-Based Problem Solving
* Foundational Data Pipeline Concepts

## Tools & Technologies

* Python
* Pandas
* SQL
* Apache Spark
* Databricks
* Jupyter Notebook

# Week 1 - Python Basics & Data Exploration

## Tasks Performed
* Loaded CSV dataset into a Pandas DataFrame
* Explored dataset using:
  * head()
  * tail()
  * shape
  * columns
  * dtypes
* Checked and handled missing values
* Removed duplicate rows
* Filtered rows and selected columns
* Created derived columns
* Saved cleaned dataset as a new CSV file

## Dataset
Shopping Dataset from Kaggle : https://www.kaggle.com/datasets/anvitkumar/shopping-dataset

## Outcome
Performed basic preprocessing and exploratory analysis on the dataset and generated a cleaned CSV file for further analysis.


# Week 2 - E-Commerce Sales Database

This assignment focuses on analyzing e-commerce sales data using SQL. The tasks include creating tables, loading data, writing queries using filtering, aggregation, joins, CASE statements, and transactions, and extracting useful business insights from the results.

## Files Included

* `WEEK2_queries.ipynb` – Notebook containing the SQL queries and any related texts.
* `week2_queries(Executable).sql` – SQL script with all the queries used in this assignment.
* `Query_Results.pdf` – Screenshots of the query outputs from the MySQL client.
* `Insights.md` – Brief observations and findings from the analysis.

## Tools Used

* MySQL Command Line Client
* Jupyter Notebook

This assignment helped me practice SQL concepts such as filtering, grouping, joins, aggregate functions, CASE statements, and basic transaction handling.

# Week 3 - Customer Sales Insights using SQL

This assignment uses the Superstore dataset to practice SQL concepts such as subqueries, CTEs, joins, and window functions.

## Tasks Performed
- Imported the Superstore dataset into a raw table.
- Created separate tables and inserted data using `SELECT DISTINCT`.
- Wrote queries using:
  - Subqueries
  - Common Table Expressions (CTEs)
  - Window Functions
  - Joins
- Made a mini-project : Analyzed customer sales data to identify:
  - Top 5 customers
  - Customers with only one order etc.

## Files
- `queries_.sql` – SQL queries used
- `Queries_results/` – outputs
- `insights.md` – Observations from the analysis
- `Sample - Superstore.csv` – Dataset used

## Tools Used
- MySQL Workbench
- Superstore Dataset

## Outcome
This assignment helped me understand how to organize data into tables and use different SQL techniques to extract meaningful business insights.

# Week 4 - Azure Cloud Fundamentals and Data Pipeline Implementation

This assignment focuses on building an end-to-end data pipeline using Azure Blob Storage and Azure Data Factory (ADF). A CSV file was uploaded to Blob Storage, connected through a Linked Service and Datasets, validated using Get Metadata, and copied to a destination container using a Copy Data pipeline.

## Files Included

* `screenshots/` – Required screenshots of all tasks.
* `mini_project with execution result/` – Pipeline Execution result.
* `Sample - Superstore.csv` – Source dataset.
* `brief_summary.md` – Assignment summary.

## Tools Used

* Microsoft Azure Portal
* Azure Blob Storage
* Azure Data Factory (ADF)

## Workflow

Blob Storage (Source CSV) → Get Metadata → Copy Data → Blob Storage (Destination)

## Output

* Pipeline executed successfully.
* Data copied to destination container.
* Metadata validated successfully.


