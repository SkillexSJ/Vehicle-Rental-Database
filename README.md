# Vehicle Rental System - Database Design & SQL Implementation

## 📌 Project Overview

This repository contains the database design and SQL solution for a **Vehicle Rental System**. The project defines a relational database schema capable of managing user authentication, vehicle fleet inventory, and booking transactions.

The implementation focuses on core RDBMS principles, including Entity Relationship Diagrams (ERD), data normalization, and structured SQL querying to address specific business logic requirements.

---

## 📊 Entity Relationship Diagram (ERD)

The database schema utilizes **1:1**, **1:N**, and **N:1** relationships to maintain data integrity between Users, Vehicles, and Bookings.

### **[🔗 View ERD (DrawSQL)](https://drawsql.app/teams/skillex/diagrams/vehicle-rental-service)**

---

## 🗄️ Database Schema Structure

The system is built upon three primary tables. Below is the structure of fields included in each table.

### 1. Users Table

_Stores customer account details._

| Field Name | Constraints          |
| ---------- | -------------------- |
| `user_id`  | **Primary Key**      |
| `name`     |                      |
| `email`    | **Unique**           |
| `password` |                      |
| `phone`    |                      |
| `role`     | **(customer/admin)** |

### 2. Vehicles Table

_Manages the inventory of vehicles_

| Field Name            | Constraints                        |
| --------------------- | ---------------------------------- |
| `vehicle_id`          | **Primary Key**                    |
| `name`                |                                    |
| `type`                | **(car/bike/truck)**               |
| `model`               |                                    |
| `registration_number` | **Unique**                         |
| `rental_price`        |                                    |
| `status`              | **(available/rented/maintenance)** |

### 3. Bookings Table

_The junction table linking Users and Vehicles for transactions._

| Field Name   | Constraints                                 |
| ------------ | ------------------------------------------- |
| `booking_id` | **Primary Key**                             |
| `user_id`    | **Foreign Key** (Ref: Users)                |
| `vehicle_id` | **Foreign Key** (Ref: Vehicles)             |
| `start_date` |                                             |
| `end_date`   |                                             |
| `total_cost` |                                             |
| `status`     | **(pending/confirmed/completed/cancelled)** |

---

## 🔗 Table Relationships

| Relationship | Description                                    |
| ------------ | ---------------------------------------------- |
| One-to-Many  | One user can have multiple bookings            |
| Many-to-One  | Multiple bookings can refer to same vehicle    |
| One-to-One   | Each booking links to one user and one vehicle |

---

## 🔎 SQL Query Implementation

The `queries.sql` file contains structured queries addressing the following analytical tasks:

### 1. Booking Reports (INNER JOIN)

Retrieves comprehensive booking details by merging data from Users and Vehicles tables.

```sql
SELECT b.booking_id , c.name as customer_name , v.name as vehicle_name , b.start_date , b.end_date , b.status
FROM bookings b
INNER JOIN users c USING(user_id)
INNER JOIN vehicles v USING(vehicle_id);
```

### 2. Inventory Analysis (NOT EXISTS)

Identifies vehicles that have no booking history.

```sql
SELECT *
FROM vehicles v
WHERE NOT EXISTS(
  SELECT *
  FROM bookings b
  WHERE b.vehicle_id = v.vehicle_id
);
```

### 3. Categorized Filtering (WHERE)

Filters available vehicles based on specific types (e.g., Cars/Bikes).

```sql
SELECT *
FROM vehicles
WHERE status = 'available' AND type = 'car';
```

### 4. Get Booking Vehicles (GROUP BY & HAVING)

Aggregates booking counts per vehicle to identify (vehicles with >2 bookings).

```sql
SELECT
    v.name AS vehicle_name,
    COUNT (b.booking_id) AS total_bookings
FROM vehicles v
JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_id , v.name
HAVING COUNT (b.booking_id) > 2;
```

---

## 📂 Contents

- `README.md` - Project documentation.
- `queries.sql` - SQL codes containing the solution code.

---

**Author:** Sajid Khan
