-- Find the top 5 most expensive flights that end in California.
SELECT flights.*
FROM flights
JOIN airports ON airports.id = flights.destination_id
JOIN states ON states.id = airports.state_id
WHERE states.name = 'California'
ORDER BY flights.price DESC
LIMIT 5;


-- Find the shortest flight that username 'zora_johnson' took.
SELECT flights.*
FROM flights
JOIN tickets ON flights.id = tickets.flight_id
JOIN itineraries ON itineraries.id = tickets.itinerary_id
JOIN users ON users.id = itineraries.user_id
WHERE users.username = 'zora_johnson'
ORDER BY flights.distance
LIMIT 1;

-- Find the average flight distance for every city in California

SELECT cities.name, ROUND(AVG(flights.distance), 2)
FROM cities
JOIN airports ON cities.id = airports.city_id
JOIN flights ON flights.destination_id = airports.id
JOIN states ON airports.state_id = states.id
WHERE states.name = 'California'
GROUP BY cities.name;

-- Find the 3 users who spent the most money on flights in 2013

SELECT users.*, SUM(flights.price) AS money_spent
FROM users
JOIN itineraries ON users.id = itineraries.user_id
JOIN tickets ON tickets.itinerary_id = itineraries.id
JOIN flights ON tickets.flight_id = flights.id
GROUP BY users.id
ORDER BY money_spent DESC
LIMIT 3;

-- Count all flights to OR from the city of Smithshire that did not land in Delaware

SELECT COUNT(*)
FROM flights
JOIN airports AS origins ON flights.origin_id = origins.id
JOIN airports AS destinations ON flights.destination_id = destinations.id
JOIN cities AS origin_cities ON origins.city_id = origin_cities.id
JOIN cities AS destination_cities ON destinations.city_id = destination_cities.id
JOIN states AS destination_states ON destinations.state_id = destination_states.id
WHERE 'Smithshire' IN (origin_cities.name, destination_cities.name)
AND destination_states.name <> 'Delaware';

-- Return the range of lengths of flights in the system(the maximum, and the minimum).
SELECT MAX(flights.distance), MIN(flights.distance)
FROM flights;
