# Week 6 -- Apache Spark DataFrame Operations

## Objective

This assignment demonstrates fundamental Apache Spark (PySpark)
DataFrame operations, file handling, schema manipulation, filtering, and
Spark architecture concepts.

## Software Requirements

-   Python 3.x
-   Apache Spark (PySpark)
-   Java 17
-   JupyterLab

## Datasets Used


- **ecommerce_dataset.csv** – Used in **Q5** to filter products by the **Electronics** category.
- **products.csv** – Used in **Q6** (rename columns and cast `price` to `double`) and **Q10** (calculate `final_price`).
- **orders.json** – Used in **Q8** to filter completed orders with an amount greater than **1000**.
- **Support_tickets.csv** – Used in **Q14** to filter records where `region = 'AMER'` OR `priority = 'high'`.
- **sample_users.csv** – Used in **Q12** to demonstrate filtering rows with non-null `user_id` values and saving the result as a CSV.

## Topics Covered

-   Spark Architecture
-   DataFrame Operations
-   File Handling 
-   Filtering and Transformations

## Outcome

The notebook demonstrates practical Spark DataFrame operations, file
format conversions, filtering, schema modifications, and the
implementation of key distributed computing concepts using PySpark.
