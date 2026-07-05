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

  -----------------------------------------------------------------------
  Dataset                             Purpose
  ----------------------------------- -----------------------------------
  **ecommerce_dataset.csv**           Q5 -- Filter products by category
                                      (`Electronics`).

  **products.csv**                    Q6 & Q10 -- Rename columns, cast
                                      `price` to `double`, and compute
                                      `final_price`.

  **orders.json**                     Q8 -- Filter completed orders where
                                      the amount is greater than 1000.

  **Support_tickets.csv**             Q14 -- Filter records where
                                      `region = 'AMER'` OR
                                      `priority = 'high'`.

  **sample_users.csv**                Q12 -- Demonstrate reading data,
                                      filtering rows with non-null
                                      `user_id`, and writing the result
                                      as CSV.
  -----------------------------------------------------------------------

## Topics Covered

-   Spark Architecture
-   DataFrame Operations
-   File Handling 
-   Filtering and Transformations

## Outcome

The notebook demonstrates practical Spark DataFrame operations, file
format conversions, filtering, schema modifications, and the
implementation of key distributed computing concepts using PySpark.
