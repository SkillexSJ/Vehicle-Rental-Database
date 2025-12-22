
-- JOIN

SELECT b.booking_id , c.name as customer_name , v.name as vehicle_name , b.start_date , b.end_date , b.status
FROM bookings b
INNER JOIN users c USING(user_id)
INNER JOIN vehicles v USING(vehicle_id)



-- EXISTS

SELECT *
FROM vehicles v
WHERE NOT EXISTS(
  SELECT *
  FROM bookings b
  WHERE b.vehicle_id = v.vehicle_id
)


-- WHERE 

SELECT *
FROM vehicles
WHERE status = 'available' AND type = 'car'


-- GROUP BY HAVING

SELECT 
    v.name AS vehicle_name, 
    COUNT(b.booking_id) AS total_bookings
FROM vehicles v
JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_id
HAVING COUNT(b.booking_id) > 2;