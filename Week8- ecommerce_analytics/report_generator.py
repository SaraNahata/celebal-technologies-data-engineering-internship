#!/usr/bin/env python
# coding: utf-8

# In[1]:


import sqlite3
from datetime import datetime, timedelta


# In[4]:


conn = sqlite3.connect("database\ecommerce.db")
cursor = conn.cursor()

# checking the connection using print("Connected Successfully!")


# In[18]:


print("----Report Generator----")
report_type = input("Enter Report Type (Daily/Weekly/Monthly): ").lower()

start_date = input("Enter Start Date (YYYY-MM-DD): ")
end_date = input("Enter End Date (YYYY-MM-DD): ")


# In[19]:


## TOTAL ORDERS :

cursor.execute("""
SELECT COUNT(*)
FROM orders
WHERE DATE(order_date)
BETWEEN ? AND ?
""",(start_date,end_date))

total_orders = cursor.fetchone()[0]

print("Total Orders :",total_orders)


# In[20]:


# REVENUE:
cursor.execute("""
SELECT ROUND(
SUM(quantity*unit_price*(1-discount_percent/100)),2)
FROM order_items oi
JOIN orders o
ON oi.order_id=o.order_id
WHERE DATE(o.order_date)
BETWEEN ? AND ?
""",(start_date,end_date))

revenue = cursor.fetchone()[0]

print("Revenue :",revenue)


# In[21]:


# Unique Customers

cursor.execute("""
SELECT COUNT(DISTINCT customer_id)
FROM orders
WHERE DATE(order_date)
BETWEEN ? AND ?
""",(start_date,end_date))

customers = cursor.fetchone()[0]

print("Unique Customers :",customers)


# In[22]:


# Top 3 Products
cursor.execute("""
SELECT p.product_name,
SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
JOIN orders o
ON oi.order_id=o.order_id
WHERE DATE(o.order_date)
BETWEEN ? AND ?
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 3
""",(start_date,end_date))

top_products = cursor.fetchall()

print("\nTop 3 Products")

for product in top_products:
    print(product[0],"-",product[1])


# In[23]:


# now Comparison with previous period (% change) 


# In[24]:


start = datetime.strptime(start_date,"%Y-%m-%d")
end = datetime.strptime(end_date,"%Y-%m-%d")

days = (end-start).days + 1

previous_end = start - timedelta(days=1)
previous_start = previous_end - timedelta(days=days-1)


# In[25]:


cursor.execute("""
SELECT ROUND(
SUM(quantity*unit_price*(1-discount_percent/100)),2)
FROM order_items oi
JOIN orders o
ON oi.order_id=o.order_id
WHERE DATE(o.order_date)
BETWEEN ? AND ?
""",(previous_start.strftime("%Y-%m-%d"),
previous_end.strftime("%Y-%m-%d")))

previous_revenue = cursor.fetchone()[0]

if previous_revenue is None:
    previous_revenue = 0


# In[26]:


if previous_revenue != 0:
    growth=((revenue-previous_revenue)/previous_revenue)*100
else:
    growth=0


# In[27]:


print("\nPrevious Revenue :",previous_revenue)
print("Growth %.2f%%"%growth)


# In[ ]:


conn.close()

input("\nPress Enter to exit...")

