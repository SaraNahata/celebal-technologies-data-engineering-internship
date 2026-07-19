#!/usr/bin/env python
# coding: utf-8

# In[15]:


import pandas as pd
import re

orders = pd.read_csv("orders.csv")
products = pd.read_csv("products.csv")
customers = pd.read_csv("customers.csv")
order_items = pd.read_csv("order_items.csv")


# In[16]:


def clean_orders(df):

    #handle missing customer IDs
    missing_ids = df["customer_id"].isna().sum()
    df["customer_id"] = df["customer_id"].fillna("UNKNOWN")

    #parse YYYY-MM-DD
    dates = pd.to_datetime(
        df["order_date"],
        format="%Y-%m-%d %H:%M:%S",
        errors="coerce"
    )

    #remaining DD-MM-YYYY
    mask = dates.isna()

    dates.loc[mask] = pd.to_datetime(
        df.loc[mask, "order_date"],
        format="%d-%m-%Y %H:%M:%S",
        errors="coerce"
    )

    invalid_dates = dates.isna().sum()

    df["order_date"] = dates.dt.strftime("%Y-%m-%d %H:%M:%S")

    print(f"Missing Customer IDs Fixed : {missing_ids}")
    print(f"Invalid Dates Found : {invalid_dates}")

    return df


# In[17]:


def clean_products(df):

    original = df["product_name"].copy()

    df["product_name"] = (
        df["product_name"]
        .str.strip()
        .str.title()
    )

    changed = (original != df["product_name"]).sum()

    print(f"Product Names Normalized : {changed}")

    return df


# In[18]:


def validate_emails(df):

    pattern = r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'

    invalid = df[
        ~df["email"].str.match(pattern, na=False)
    ]

    print(f"Invalid Emails : {len(invalid)}")

    return invalid["customer_id"].tolist()


# In[19]:


def check_referential_integrity(order_items, orders):

    invalid_rows = order_items[
        ~order_items["order_id"].isin(
            orders["order_id"]
        )
    ]

    print(f"Broken References : {len(invalid_rows)}")

    return invalid_rows


# In[20]:


def clean_order_items(df):

    negative_count = (df["quantity"] < 0).sum()

    df["quantity"] = df["quantity"].abs()

    print(f"Negative Quantities Fixed : {negative_count}")

    return df


# In[21]:


orders = clean_orders(orders)

products = clean_products(products)

invalid_customers = validate_emails(customers)

invalid_order_items = check_referential_integrity(order_items,orders)


# In[22]:


import os


# In[23]:


orders.to_csv(
    r"C:\Users\BIT\Documents\celebal-technologies-data-engineering-internship\Week8- ecommerce_analytics\data\cleaned\orders.csv",
    index=False
)

products.to_csv(
    r"C:\Users\BIT\Documents\celebal-technologies-data-engineering-internship\Week8- ecommerce_analytics\data\cleaned\products.csv",
    index=False
)

customers.to_csv(
    r"C:\Users\BIT\Documents\celebal-technologies-data-engineering-internship\Week8- ecommerce_analytics\data\cleaned\customers.csv",
    index=False
)

order_items.to_csv(
    r"C:\Users\BIT\Documents\celebal-technologies-data-engineering-internship\Week8- ecommerce_analytics\data\cleaned\order_items.csv",
    index=False
)


# In[ ]:





# In[ ]:




