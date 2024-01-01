Q1: what is the senior employees?
SELECT * 
FROM employee
where levels = 'L6'


Q2: which county have most invoices?
SELECT  billing_country as country, 
count( billing_country) as Total_invoice
FROM invoice
group by  billing_country 
limit 5



Q3 what are the top 3 vaue of invoice

select billing_country,  total
from invoice
order by total desc
limit 3

Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals

SELECT billing_city, sum(total) as most_profit
FROM invoice
group by billing_city
order by sum(total) desc
limit 1

Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.

SELECT first_name, sum(total)
FROM invoice
join
customer
group by first_name
order by sum(total) desc
limit 1

Q6  Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A.

SELECT first_name , last_name , email, genre.name
FROM customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
join track on invoice_line.track_id = track.track_id
join genre on track.genre_id = genre.genre_id
where genre.genre_id = 1
order by first_name

 Q7 Lets invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands

SELECT artist.name,  count(genre.name) as total_rock_songs
FROM artist
join album2 on artist.artist_id = album2.artist_id
join track on album2.album_id = track.album_id
join genre on track.genre_id = genre.genre_id
where genre.name = 'rock'
group by artist.name, genre.name
order by total_rock_songs desc


Q8: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.

select name, milliseconds
from track
where milliseconds >
(
SELECT avg( milliseconds) 
FROM track)

order by milliseconds desc


 Q9 Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent 
 
 SELECT first_name as cust_name, artist.name as art_name , sum(invoice.total) as total_spend
FROM customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
join track on invoice_line.track_id = track.track_id
join album2 on track.album_id = album2.album_id
join artist on album2.album_id = artist.artist_id

group by customer.first_name, artist.name 
order by sum(invoice.total) desc
 
 

 







