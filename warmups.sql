-- Get a list of all users in California
SELECT users.*
FROM users
JOIN states ON users.state_id = states.id
where states.name = 'California';

-- Get a list of all airports in Kadeton
SELECT airports.*
FROM airports
JOIN cities ON airports.city_id = cities.id
where cities.name = 'Kadeton';

-- Get a list of all payment methods used on itineraries by the user with email address 'senger.krystel@marvin.io'
SELECT DISTINCT payment_method
FROM itineraries
JOIN users ON itineraries.user_id = users.id
WHERE email = 'senger.krystel@marvin.io';

-- Get a list of prices of all flights whose origins are in Kochfurt Probably International Airport.
SELECT price
FROM flights
JOIN airports ON flights.origin_id = airports.id
WHERE long_name = 'Kochfurt Probably International Airport';

-- Find a list of all Airport names and codes which connect to the airport coded LYT.
SELECT DISTINCT origin_name AS name, connections.origin_code AS code
FROM
(SELECT origins.long_name AS origin_name, origins.code AS origin_code, destinations.long_name AS destination_name, destinations.code
FROM flights
JOIN airports AS origins
ON flights.origin_id = origins.id
JOIN airports AS destinations
ON flights.destination_id = destinations.id
WHERE origins.code = 'LYT' OR destinations.code = 'LYT') AS connections
WHERE connections.origin_code <> 'LYT'
UNION
SELECT DISTINCT destination_name, connections.destination_code
FROM
(SELECT origins.long_name, origins.code, destinations.long_name AS destination_name, destinations.code AS destination_code
FROM flights
JOIN airports AS origins
ON flights.origin_id = origins.id
JOIN airports AS destinations
ON flights.destination_id = destinations.id
WHERE origins.code = 'LYT' OR destinations.code = 'LYT') AS connections
WHERE connections.destination_code <> 'LYT';

-- Get a list of all airports visited by user Krystel Senger after January 1, 2012. (Hint, see if you can get a list of all ticket IDs first).

SELECT airports.*
FROM
-- ids of destination airports for flights for the given passenger
(SELECT destination_id
FROM flights 
JOIN tickets ON flights.id = tickets.flight_id
JOIN itineraries ON tickets.itinerary_id = itineraries.id
JOIN users ON itineraries.user_id = users.id
WHERE first_name = 'Krystel' 
AND last_name = 'Senger'
AND flights.departure_time > '2012-01-01') AS dest_airport_ids
JOIN airports ON airports.id = dest_airport_ids.destination_id












