#!/usr/bin/env python
# coding: utf-8

# In[5]:


import sqlite3

conn = sqlite3.connect("database\ecommerce.db"
)
cursor = conn.cursor()


# In[7]:


import pandas as pd

customers = pd.read_csv("data/cleaned/customers.csv")
products = pd.read_csv("data/cleaned/products.csv")
orders = pd.read_csv("data/cleaned/orders.csv")
order_items = pd.read_csv("data/cleaned/order_items.csv")


# In[8]:


customers.to_sql(
    "customers",
    conn,
    if_exists="replace",
    index=False
)

products.to_sql(
    "products",
    conn,
    if_exists="replace",
    index=False
)

orders.to_sql(
    "orders",
    conn,
    if_exists="replace",
    index=False
)

order_items.to_sql(
    "order_items",
    conn,
    if_exists="replace",
    index=False
)


# In[10]:


conn.commit()
conn.close()

print("Database created successfully!")


# In[ ]:




