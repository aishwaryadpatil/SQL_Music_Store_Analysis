/* Q1: Who is the senior most employee based on job title? */

SELECT * from employee
ORDER BY levels DESC
limit 1

/* Q2: Which countries have the most Invoices? */
SELECT COUNT(*) as Count,billing_country
from invoice
GROUP BY billing_country
ORDER BY Count desc;

/* Q3: What are top 3 values of total invoice? */
SELECT total 
from invoice
ORDER BY total desc
limit 3;

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */

SELECT SUM(total) as invoice_total , billing_city
from invoice
GROUP BY billing_city
ORDER BY invoice_total DESC;



/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/
select * from customer
SELECT customer.first_name, customer.last_name,SUM(invoice.total)as Total
from Customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY Total desc
limit 1

/* Q6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */
select * from invoice_line
select * from invoice
select * from track
select * from genre
SELECT DISTINCT c.email , c.first_name ,c.last_name
from customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoice_line ON i.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;

/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;


/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */
select * from track


SELECT name,milliseconds
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	FROM track )
ORDER BY milliseconds DESC;


