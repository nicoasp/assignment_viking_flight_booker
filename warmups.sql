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
SELECT long_name, code 
FROM airports
JOIN flights ON (flights.origin_id = airports.id OR flights.destination_id = airports.id)
ORDER BY long_name
LIMIT 100;


-- Get a list of all airports visited by user Krystel Senger after January 1, 2012. (Hint, see if you can get a list of all ticket IDs first).