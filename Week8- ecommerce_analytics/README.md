\# Week 8 - E-Commerce Order Analytics System



\## Overview



The project focuses on building an end-to-end e-commerce analytics pipeline using \*\*Python, Pandas, SQLite, and SQL\*\*. It includes data generation, data cleaning, SQL analysis, Python-SQL integration, and edge case validation.



\---



\## Technologies Used



\- Python

\- Pandas

\- SQLite

\- SQL

\- Jupyter Notebook



\---



\## Project Structure



```

Week8- ecommerce\_analytics/

│

├── README.md

│

├── Data Generation

│   └── data/

│       └── raw\_data/

│           ├── customers.csv

│           ├── orders.csv

│           ├── order\_items.csv

│           └── products.csv

│

├── Data Cleaning

│   ├── cleaning\_data.py

│   └── data/

│       └── cleaned/

│           ├── customers.csv

│           ├── orders.csv

│           ├── order\_items.csv

│           └── products.csv

│

├── SQL Analysis

│   ├── sql-queries/

│   │   ├── basic\_queries.sql

│   │   ├── intermediate\_queries.sql

│   │   └── advanced\_queries.sql

│   │

│   └── sql-queries-outputs/

│       ├── basic\_queries/

│       ├── intermediate\_queries/

│       └── advanced\_queries/

│

├── Python + SQL Integration

│   ├── create\_database\_for\_report.py

│   ├── report\_generator.py

│   ├── report\_generator-output.png

│── database/

│       ├── ecommerce.db

│       └── schema.sql

│

└── Edge Case Handling

&#x20;   ├── Edge\_cases\_check.py

&#x20;   └── Edge\_cases\_check-output.png

```



\---



\## Workflow



\### Data Generation

\- Generated realistic e-commerce datasets with intentional inconsistencies.



\### Data Cleaning

\- Cleaned and standardized the generated datasets.

\- Validated emails, corrected date formats, normalized product names, and checked referential integrity.



\### SQL Analysis

\- Performed basic, intermediate, and advanced SQL queries to generate business insights.



\### Python + SQL Integration

\- Created a SQLite database and built a command-line report generator.



\### Edge Case Handling

\- Tested invalid order IDs, incorrect discounts, zero quantities, and future order dates.



\---



\## How to Run



1\. Clean the datasets



```bash

python cleaning\_data.py

```



2\. Create the database



```bash

python create\_database\_for\_report.py

```



3\. Generate reports



```bash

python report\_generator.py

```



4\. Run edge case tests



```bash

python Edge\_cases\_check.py

```



\---



\## Learning Outcomes



\- Data Generation

\- Data Cleaning using Pandas

\- SQL Analysis

\- SQLite Database Management

\- Python and SQL Integration

\- Edge Case Testing



\---



\## Author



\*\*Sara Nahata\*\*



Celebal Technologies – Data Engineering Internship (Week 8)

