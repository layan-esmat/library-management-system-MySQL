# Library Database System (MySQL)

## Overview
This project implements a simple **Library Management System** using MySQL. It demonstrates database creation, table design with constraints, data insertion, and SQL queries involving joins and conditions.

## Database Design
The database `library` consists of three related tables:
- **Book**: Stores book details with constraints such as primary key, unique ISBN, default values, and category checks.
- **Member**: Stores library member information with defaults for nationality, membership date, and type.
- **Borrowing**: Links books and members, tracking borrow dates, due dates, return dates, and fines using foreign keys and check constraints.

## Key Features
- Use of **PRIMARY KEY**, **FOREIGN KEY**, **UNIQUE**, **CHECK**, and **DEFAULT** constraints
- Enforcement of data integrity between tables
- Sample data insertion for testing relationships
- Queries demonstrating **INNER JOINs**, filtering, grouping, ordering, and NULL handling

## Queries Included
- Retrieve borrowing details with member and book information
- List borrowed books and member details
- Filter books by category
- Display books borrowed by Saudi members
- Identify fines for unreturned books

## Technology
- SQL (MySQL)

## Purpose
This project serves as a practical example of relational database design and querying using core SQL concepts.
