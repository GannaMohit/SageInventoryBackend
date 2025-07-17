# SageInventoryBackend

## API
Post: New product

Update: Product stock, product detail

Get: Product detail

Delete: Remove product

## SQL
Product Table
PK: P_ID
P_name
Dept
Price
Quantity

User Table
PK: U_ID
username
password
permission

Invoice Table
PK: I_ID
Date
Time
Status

Invoice Detail
FK: I_ID
Product
Quantity