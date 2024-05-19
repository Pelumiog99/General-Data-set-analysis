-- 1.Retrieve the customer information (Customer_id, Gender, Age) for all customers who made a purchase.
ans: select customer_id, gender, age from customer_data
--2.List the unique shopping malls where the transactions took place.
ans: select distinct shopping_mall from sales_data
group by shopping_mall
--3.Display the total quantity of products purchased for each transaction type.
select transaction_type, count(quantity)
from customer_data c
join sales_data s
on c.customer_id = s.customer_id
group by transaction_type
--4. Find the average age of customers who made online transactions.
select ceiling(avg(age)) from customer_data
where transaction_type = 'online'
group by age
limit 1

--5.Show the customer details (Customer_id, Gender, Age) who made a purchase in the city of Winnipeg.
select c.customer_id, c.gender, c.age, s.city
from customer_data c
inner join sales_data s
on c.customer_id = s.customer_id
where s.city = 'winnipeg'
--6.Count the number of transactions for each payment type.
select payment_type, count(*) from customer_data
group by payment_type
--7.Find the total price for each category of products.
select category, sum(price) as total_prices from sales_data
group by category
--8.Identify the city with the highest total sales amount
select city, max(price)as highest_total from sales_data
group by city
order by highest_total desc
--9.List the top 5 customers with the highest total spending.
select customer_id, max(price) as total_spending from sales_data
group by customer_id
order by total_spending desc
limit 5
--10. select category, avg(price) from sales_data
group by category
--11.Show the transactions where customers paid with a debit card and the transaction type was in person.
select *
from customer_data c
full outer join sales_data s
on c.customer_id = s.customer_id
where payment_type = 'debit card' and transaction_type = 'in person'
--12.Display the oldest and youngest customers.
  SELECT MAX(age) AS oldest, MIN(age) AS youngest 
    FROM customer_data
ORDER BY oldest DESC, youngest
LIMIT 1
--13.select s.province, count(transaction_type)
from customer_data c
full outer join sales_data s
on c.customer_id = s.customer_id
group by s.province
---14.List the customers who made a purchase in both October and November of 2021.
select customer_id, extract(year from invoice_date), extract(month from invoice_date) from sales_data
where extract(year from invoice_date) = 2021 and extract(month from invoice_date) in (10, 11)
--15.Calculate the total spending for each gender.
select c.gender, sum(price) as total_spending from customer_data c
full outer join sales_data s
on c.customer_id = s.customer_id
group by c.gender
--16.Retrieve the customer information for customers who made a purchase in British Columbia.
select customer_id, province from sales_data
where province = 'british columbia'
--17.Identify the most popular category of products based on the quantity sold.
select category, count(quantity) from sales_data
group by category
order by count(quantity) desc
limit 1
--18.Display the transactions where the customers age is above the average age.
select transaction_type, age from customer_data
where age > (select avg(age) from customer_data)
--19.List the products with a price greater than $1000.
select category from sales_data
where price > 1000
--20. Find the month with the highest total sales.
select extract(month from invoice_date), max(price) as total_sales from sales_data
group by extract(month from invoice_date)
order by total_sales desc
limit 1
