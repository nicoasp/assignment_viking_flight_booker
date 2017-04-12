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



-- Find the 3 users who spent the most money on flights in 2013
-- Count all flights to OR from the city of Smithshire that did not land in Delaware
-- Return the range of lengths of flights in the system(the maximum, and the minimum).