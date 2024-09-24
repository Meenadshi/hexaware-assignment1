--Ticket Booking System
--Task 1: Database Design
--1. Create the database named "TicketBookingSystem"
create database TicketBookingSystem
use TicketBookingSystem
--2. Write SQL scripts to create the mentioned tables with appropriate data types, constraints, and
--relationships.
--• Venu
--• Event
--• Customers
--• Booking

create table Venue(
venue_id int identity(1,1) primary key,
venue_name varchar(50) not null,
venue_address varchar(256) not null
);

create table booking (
    booking_id int identity(1,1) primary key,
    num_tickets int not null,
    total_cost decimal(10,2) not null,
    booking_date date not null,
	customer_id int not null,
	event_id int not null
);

create table customers (
    customer_id int identity(1,1) primary key,
    customer_name varchar(100) not null,
    email varchar(100) not null,
    phone_number varchar(15) not null
);

create table event (
    event_id int identity(1,1) primary key,
    event_name varchar(100) not null,
	venue_id int not null,
    event_date date not null,
    event_time time not null,
    total_seats int not null,
    available_seats int not null,
    ticket_price decimal(10,2) not null,
    event_type varchar(20) check (event_type in ('movie', 'sports', 'concert'))
);

--3. Create an ERD (Entity Relationship Diagram) for the database.

--4. Create appropriate Primary Key and Foreign Key constraints for referential integrity.

--alter table venu
--add constraint pk_venue_id primary key (venue_id);

alter table event
add constraint fk_event_venue foreign key (venue_id) references venue(venue_id)
	--constraint pk_event_id primary key (event_id),
	--constraint fk_event_booking foreign key (booking_id) references booking(booking_id);

--alter table customers
--add constraint fk_customers_booking foreign key (booking_id) references booking(booking_id);
	--constraint pk_customer_id primary key (customer_id)

alter table booking
add constraint fk_booking_customer foreign key (customer_id) references customers(customer_id),
	--constraint pk_booking_id primary key (booking_id),
	constraint fk_booking_event foreign key (event_id) references event(event_id);

--Tasks 2: Select, Where, Between, AND, LIKE:
--1. Write a SQL query to insert at least 10 sample records into each table.

insert into venue (venue_name, venue_address)
values 
('grand theater', '123 broadway ave'),
('city concert hall', '456 music st'),
('downtown sports arena', '789 sports blvd'),
('starlight cinema', '321 star rd'),
('sunrise auditorium', '555 sunrise ave'),
('ocean view concert hall', '111 ocean view blvd'),
('metropolitan arena', '789 metropolis st'),
('horizon sports complex', '678 horizon way'),
('riverview open air theater', '222 river st'),
('capitol event center', '333 capitol hill rd');

insert into customers (customer_name, email, phone_number)
values
('john doe', 'john.doe@example.com', '1234567890'),
('jane smith', 'jane.smith@example.com', '0987654321'),
('rohit kumar', 'rohit.kumar@example.com', '1231231234'),
('anjali rao', 'anjali.rao@example.com', '9876543210'),
('vikas mehra', 'vikas.mehra@example.com', '7890123456'),
('lakshmi venkat', 'lakshmi.venkat@example.com', '8765432109'),
('maria johnson', 'maria.johnson@example.com', '5678901234'),
('carlos hernandez', 'carlos.h@example.com', '4567890123'),
('emma watson', 'emma.watson@example.com', '3456789012'),
('nina patel', 'nina.patel@example.com', '2345678901');

insert into event (event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type)
values
('avengers: endgame', '2024-09-25', '19:00:00', 1, 200, 150, 12.50, 'movie'),
('coldplay concert', '2024-10-10', '20:00:00', 2, 500, 480, 50.00, 'concert'),
('football match', '2024-10-05', '18:00:00', 3, 300, 290, 30.00, 'sports'),
('inception', '2024-09-30', '21:00:00', 4, 150, 100, 15.00, 'movie'),
('rock concert', '2024-10-12', '19:30:00', 5, 400, 350, 45.00, 'concert'),
('tennis championship', '2024-10-07', '16:00:00', 6, 1000, 990, 25.00, 'sports'),
('hamlet play', '2024-10-15', '18:30:00', 7, 250, 230, 20.00, 'concert'),
('city marathon', '2024-11-01', '06:00:00', 8, 2000, 1950, 5.00, 'sports'),
('moonlight theater', '2024-09-22', '20:00:00', 9, 300, 290, 10.00, 'movie'),
('jazz night', '2024-11-03', '21:30:00', 10, 350, 320, 40.00, 'concert');

INSERT INTO booking (num_tickets, total_cost, booking_date, customer_id, event_id)
VALUES
(2, 25.00, '2024-09-15', 1, 10),
(4, 200.00, '2024-09-16', 2, 8),
(1, 30.00, '2024-09-17', 3,17),
(3, 45.00, '2024-09-18', 3, 16),
(2, 90.00, '2024-09-19', 1, 9),
(1, 25.00, '2024-09-20', 4, 12),
(5, 100.00, '2024-09-21', 2, 12),
(3, 15.00, '2024-09-22', 5, 9),
(2, 20.00, '2024-09-23', 5, 17),
(6, 240.00, '2024-09-24', 5, 10);

--2. Write a SQL query to list all Events.
SELECT * FROM Event;

--3. Write a SQL query to select events with available tickets.
SELECT * FROM Event 
WHERE available_seats > 0;

--4. Write a SQL query to select events name partial match with ‘cup’.
SELECT * FROM Event 
WHERE event_name LIKE '%cup%';

--5. Write a SQL query to select events with ticket price range is between 1000 to 2500.
SELECT * FROM Event 
WHERE ticket_price BETWEEN 1000 AND 2500;

--6. Write a SQL query to retrieve events with dates falling within a specific range.
SELECT * FROM Event 
WHERE event_date BETWEEN '2024-09-01' AND '2024-12-31';

--7. Write a SQL query to retrieve events with available tickets that also have "Concert" in their name.
SELECT * FROM Event 
WHERE available_seats > 0 AND event_name LIKE '%Concert%';

--8. Write a SQL query to retrieve users in batches of 5, starting from the 6th user.
SELECT * FROM Customer 
ORDER BY customer_id 
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

--9. Write a SQL query to retrieve bookings details contains booked no of ticket more than 4.
SELECT * FROM Booking 
WHERE num_tickets > 4;

--10. Write a SQL query to retrieve customer information whose phone number end with ‘000’
SELECT * FROM Customer 
WHERE phone_number LIKE '%000';

--11. Write a SQL query to retrieve the events in order whose seat capacity more than 15000.
SELECT * FROM Event 
WHERE total_seats > 15000 
ORDER BY total_seats;

--12. Write a SQL query to select events name not start with ‘x’, ‘y’, ‘z’
SELECT * FROM Event 
WHERE event_name NOT LIKE 'x%' 
	AND event_name NOT LIKE 'y%' 
	AND event_name NOT LIKE 'z%';


--Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins:
--1. Write a SQL query to List Events and Their Average Ticket Prices.
SELECT event_name, AVG(ticket_price) AS average_ticket_price
FROM Event
GROUP BY event_name;

--2. Write a SQL query to Calculate the Total Revenue Generated by Events.
SELECT e.event_name, SUM(b.total_cost) AS total_revenue
FROM Booking b
JOIN Event e ON b.event_id = e.event_id
GROUP BY e.event_name

--3. Write a SQL query to find the event with the highest ticket sales.
SELECT TOP 1 event_name, SUM(num_tickets) AS total_tickets_sold
FROM Booking
JOIN Event ON Booking.event_id = Event.event_id
GROUP BY event_name
ORDER BY total_tickets_sold DESC

--4. Write a SQL query to Calculate the Total Number of Tickets Sold for Each Event.
SELECT event_name, SUM(num_tickets) AS total_tickets_sold
FROM Booking
JOIN Event ON Booking.event_id = Event.event_id
GROUP BY event_name
ORDER BY total_tickets_sold DESC;

--5. Write a SQL query to Find Events with No Ticket Sales.
SELECT e.event_name
FROM Event e
LEFT JOIN Booking b ON e.event_id = b.event_id
WHERE b.event_id IS NULL;

--6. Write a SQL query to Find the User Who Has Booked the Most Tickets.
SELECT TOP 1 c.customer_name, SUM(b.num_tickets) AS total_tickets
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_tickets DESC

--7. Write a SQL query to List Events and the total number of tickets sold for each month.
SELECT e.event_name, DATEPART(MONTH, b.booking_date) AS month, SUM(b.num_tickets) AS total_tickets_sold
FROM Booking b
JOIN Event e ON b.event_id = e.event_id
GROUP BY e.event_name, DATEPART(MONTH, b.booking_date)

--8. Write a SQL query to calculate the average Ticket Price for Events in Each Venue.
SELECT Venue.venue_name, AVG(Event.ticket_price) AS average_ticket_price
FROM Event
JOIN Venue ON Event.venue_id = Venue.venue_id
GROUP BY Venue.venue_name;

--9. Write a SQL query to calculate the total Number of Tickets Sold for Each Event Type.
SELECT event_type, SUM(num_tickets) AS total_tickets_sold
FROM Booking
JOIN Event ON Booking.event_id = Event.event_id
GROUP BY event_type;

--10. Write a SQL query to calculate the total Revenue Generated by Events in Each Year.
SELECT YEAR(booking_date) AS year, SUM(num_tickets * ticket_price) AS total_revenue
FROM Booking
JOIN Event ON Booking.event_id = Event.event_id
GROUP BY YEAR(booking_date);

--11. Write a SQL query to list users who have booked tickets for multiple events.
SELECT c.customer_name, COUNT(DISTINCT b.event_id) AS eventcount
FROM Customer c
JOIN Booking b ON c.customer_id = b.customer_id
GROUP BY c.customer_name
HAVING COUNT(DISTINCT b.event_id) > 1;

--12. Write a SQL query to calculate the Total Revenue Generated by Events for Each User.
SELECT c.customer_name, SUM(b.total_cost) AS total_revenue
FROM Customer c
JOIN Booking b ON c.customer_id = b.customer_id
GROUP BY c.customer_name
ORDER BY total_revenue desc;

--13. Write a SQL query to calculate the Average Ticket Price for Events in Each Category and Venue.
SELECT e.event_type, v.venue_name, AVG(e.ticket_price) AS average_ticket_price
FROM Event e
JOIN Venue v ON e.venue_id = v.venue_id
GROUP BY e.event_type, v.venue_name;

--14. Write a SQL query to list Users and the Total Number of Tickets They've Purchased in the Last 30 Days
SELECT c.customer_name, SUM(b.num_tickets) AS puchased_tickets
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
WHERE b.booking_date >= DATEADD(DAY, -30, GETDATE())
GROUP BY c.customer_name;


--Task 4:
-- 1. Calculate the Average Ticket Price for Events in Each Venue Using a Subquery
SELECT v.venue_name, (SELECT AVG(e.ticket_price) 
		FROM Event e 
        WHERE e.venue_id = v.venue_id) AS average_ticket_price
FROM Venue v;

-- 2. Find Events with More Than 50% of Tickets Sold using subquery
SELECT event_id, event_name
FROM Event e
WHERE available_seats < (SELECT total_seats / 2 FROM Event WHERE event_id = e.event_id);

SELECT e.event_name, 
(SELECT SUM(b.num_tickets) 
FROM Booking b 
WHERE b.event_id = e.event_id) AS total_tickets_sold
FROM Event e;

-- 4. Find Users Who Have Not Booked Any Tickets Using a NOT EXISTS Subquery
SELECT *
FROM Customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM Booking b
    WHERE b.customer_id = c.customer_id
);

-- 5. List Events with No Ticket Sales Using a NOT IN Subquery
SELECT *
FROM Event
WHERE event_id NOT IN (
    SELECT event_id
    FROM Booking
);

-- 6. Calculate the Total Number of Tickets Sold for Each Event Type Using a Subquery in the FROM Clause
SELECT event_type, SUM(total_tickets_sold) AS Tickets_sold
FROM (SELECT e.event_type, SUM(b.num_tickets) AS total_tickets_sold
      FROM Event e
      JOIN Booking b ON e.event_id = b.event_id
      GROUP BY e.event_type) AS subquery
GROUP BY event_type

-- 7. Find Events with Ticket Prices Higher Than the Average Ticket Price Using a Subquery in the WHERE Clause
SELECT *
FROM Event
WHERE ticket_price > (SELECT AVG(ticket_price) FROM Event);

-- 8. Calculate the Total Revenue Generated by Events for Each User Using a Correlated Subquery
SELECT c.customer_id, c.customer_name, 
    (SELECT SUM(num_tickets * e.ticket_price)
     FROM Booking b
     JOIN Event e ON b.event_id = e.event_id
     WHERE b.customer_id = c.customer_id) AS total_revenue
FROM Customer c;

-- 9. List Users Who Have Booked Tickets for Events in a Given Venue Using a Subquery in the WHERE Clause
SELECT DISTINCT c.customer_id, c.customer_name
FROM Customer c
WHERE c.customer_id IN (
    SELECT b.customer_id
    FROM Booking b
    JOIN Event e ON b.event_id = e.event_id
    WHERE e.venue_id = 1
);

-- 10. Calculate the Total Number of Tickets Sold for Each Event Category Using a Subquery with GROUP BY
SELECT event_type, SUM(num_tickets) AS total_tickets_sold
FROM Booking b
JOIN Event e ON b.event_id = e.event_id
GROUP BY event_type;

-- 11. Find Users Who Have Booked Tickets for Events in each Month Using a Subquery with DATE_FORMAT
SELECT DISTINCT c.customer_id, c.customer_name
FROM Customer c
WHERE c.customer_id IN (
    SELECT b.customer_id
    FROM Booking b
    JOIN Event e ON b.event_id = e.event_id
    WHERE MONTH(e.event_date) = 10  -- Replace with the desired month (1-12)
);

-- 12. Calculate the Average Ticket Price for Events in Each Venue Using a Subquery
SELECT v.venue_name, (SELECT AVG(e.ticket_price) FROM Event e 
        WHERE e.venue_id = v.venue_id) AS average_ticket_price
FROM Venue v;