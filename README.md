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

## 🔎 SQL Query Implementation

The `queries.sql` file contains structured queries addressing the following analytical tasks:

- **Booking Reports (INNER JOIN):** Retrieves comprehensive booking details by merging data from Users and Vehicles tables.
- **Inventory Analysis (NOT EXISTS):** Identifies vehicles that have no booking history.
- **Categorized Filtering (WHERE):** Filters available vehicles based on specific types (e.g., Cars/Bikes).
- **Get Booking Vehicles (GROUP BY & HAVING):** Aggregates booking counts per vehicle to identify (vehicles with >2 bookings).

---

## 📂 Repository Contents

- `README.md` - Project documentation.
- `queries.sql` - SQL scripts containing the solution code.

---

**Author:** Sajid Khan
