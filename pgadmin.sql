SELECT 
  f.flight_no,
  f.departure_airport,
  f.arrival_airport,
  a.airport_name->>'ru' AS departure_airport_name,
  to_char(f.actual_arrival AT TIME ZONE 'UTC', 'YYYY-MM-DD HH24:MI:SS') || '+00:00' AS actual_arrival
FROM flights AS f
JOIN airports_data AS a 
    ON a.airport_code = f.departure_airport
WHERE status = 'Arrived'
ORDER BY f.actual_arrival DESC
LIMIT 20;