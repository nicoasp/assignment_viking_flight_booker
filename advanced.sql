-- Find the most popular travel destination for users who live in California.
SELECT airports.long_name, COUNT(*) AS flight_count
FROM users
JOIN states ON users.state_id = states.id
JOIN itineraries ON itineraries.user_id = users.id 
JOIN tickets ON tickets.itinerary_id = itineraries.id 
JOIN flights ON flights.id = tickets.flight_id
JOIN airports ON flights.destination_id = airports.id
WHERE states.name = 'California'
GROUP BY airports.long_name
ORDER BY flight_count DESC
LIMIT 1;


-- How many flights have round trips possible? In other words, we want the count of all airports where there exists a flight FROM that airport and a later flight TO that airport.
SELECT x.origin_id
FROM flights x 
JOIN flights y ON x.destination_id = y.origin_id
WHERE x.origin_id = y.destination_id
AND x.arrival_time < y.departure_time;


SELECT x.origin_id
FROM flights x 
JOIN airports ON x.destination_id = airports.id
JOIN flights y ON airports.id = y.origin_id
WHERE x.origin_id = y.destination_id
AND x.arrival_time < y.departure_time;


SELECT x.origin_id
FROM flights x, flights y
WHERE 
x.origin_id = y.destination_id
AND x.destination_id = y.origin_id
AND x.arrival_time < y.departure_time;


-- Find the cheapest flight that was taken by a user who only had one itinerary.
-- Find the average cost of a flight itinerary for users in each state in 2012.
-- Bonus: You're a tourist. It's May 6, 2013. Book the cheapest set of flights over the next six weeks that connect Oregon, Pennsylvania and Arkansas, but do not take any flights over 400 miles in distance. Note: This can be ~50 lines long but doesn't require any subqueries.