
import sqlite3

conn = sqlite3.connect("database\ecommerce.db")
cursor = conn.cursor()


#Check if order_items contains an order_id that doesn't exist in orders.

def test_invalid_order_id():
    cursor.execute("""
    SELECT COUNT(*)
    FROM order_items
    WHERE order_id NOT IN (
        SELECT order_id
        FROM orders
    )
    """)

    count = cursor.fetchone()[0]

    if count > 0:
        print(f"FAIL: {count} invalid order_id(s) found.")
    else:
        print("PASS: All order_ids are valid.")

# check for Discount greater than 100% as that is incorrect and makes no sense

def test_invalid_discount():
    cursor.execute("""
    SELECT COUNT(*)
    FROM order_items
    WHERE discount_percent > 100
    """)

    count = cursor.fetchone()[0]

    if count > 0:
        print(f"FAIL: {count} item(s) have discount > 100%.")
    else:
        print("PASS: All discounts are valid.")

# check for quantity equals 0
def test_zero_quantity():
    cursor.execute("""
    SELECT COUNT(*)
    FROM order_items
    WHERE quantity = 0
    """)

    count = cursor.fetchone()[0]

    if count > 0:
        print(f" FAIL: {count} item(s) have zero quantity.")
    else:
        print("PASS: No zero quantity items found.")

# check for future order dates
def test_future_order_date():
    cursor.execute("""
    SELECT COUNT(*)
    FROM orders
    WHERE DATE(order_date) > DATE('now')
    """)

    count = cursor.fetchone()[0]

    if count > 0:
        print(f"FAIL: {count} future order(s) found.")
    else:
        print("PASS: No future order dates.")

print("Running Edge Case Tests...\n")

test_invalid_order_id()
test_invalid_discount()
test_zero_quantity()
test_future_order_date()

conn.close()
input("press enter to close..")






