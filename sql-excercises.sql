1. Return all category names with their descriptions from the Categories table.

select CategoryName
from Categories

2. Return the contact name, customer id, and company name of all Customers in London

select contactName, customerId, companyName, City
from customers
where City = 'London' 

3. Return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number

select *
from Suppliers
where ContactTitle in ('Sales Representive', 'Marketing Manager') AND FAX IS NOT NULL

4. Return a list of customer ids from the Orders table with required dates between Jan 1, 1997 and Jan 1, 1998 and with freight under 100 units.

select CustomerID
from Orders
where RequiredDate between '1997-1-1' and '1998-1-1' and Freight < 100 

Return a list of company names and contact names of all the Owners from the Customer table from Mexico, Sweden and Germany.

select CompanyName, ContactName
from Customers
where Country in ('Sweden', 'Germany', 'Mexico')

Return a count of the number of discontinued products in the Products table.

select COUNT (discontinued)
from Products

Return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.

select CategoryName, Description
from Categories
where CategoryName like 'Co%'

Return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.

select CompanyName, City, Country, PostalCode
from Suppliers
where Address like '%rue%'
order by CompanyName

Return the product id and the total quantities ordered for each product id in the Order Details table.

select distinct ProductID, Quantity
from [Order Details]

Return the customer name and customer address of all customers with orders that shipped using Speedy Express.

select CompanyName, Address
from Customers
inner join Orders
on Customers.CustomerID=Orders.CustomerID
where ShipVia = 1

Return a list of Suppliers containing company name, contact name, contact title and region description.

select CompanyName, ContactName, ContactTitle, Region
from Suppliers
where Region is not null

Return all product names from the Products table that are condiments.

select ProductName
from Products
where CategoryID = 2

Return a list of customer names who have no orders in the Orders table.

select ContactName
from Customers
left join Orders
on.Orders.CustomerID = Customers.CustomerID
where Orders.CustomerID is Null

Add a shipper named 'Amazon' to the Shippers table using SQL.

insert into Shippers(CompanyName)
values ('Amazon')

Change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL

update Shippers
set CompanyName = ('Amazon Prime Shipping')
where CompanyName = ('Amazon')

Return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.

select Shippers.CompanyName, FORMAT(ROUND(SUM(Orders.Freight),0),'C') as FreightTotals
from Orders
left join Shippers
on Orders.ShipVia = Shippers.ShipperID
group by CompanyName;

Return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'

select LastName + ',' + FirstName AS DisplayName
from Employees

Add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread

insert into Customers(CustomerID, CompanyName, ContactName)
values ('6730' , 'Torkelson Enterprises' , 'Mathew Torkelson')
insert into Orders(CustomerID, ShipName)
values ('6730' , 'Grandmas Boysenberry Spread')

Remove yourself and your order from the database.

delete from Customers
where CustomerID = '6730'
delete from Orders
where CustomerID = '6730'

Return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100.

select ProductName, UnitsInStock + UnitsOnOrder as TotalUnits
from Products
where UnitsInStock > 100
