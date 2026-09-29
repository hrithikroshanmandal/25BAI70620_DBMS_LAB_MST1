-- Create a simple Library Management System using Book and Member tables.
-- 1. Create both tables with suitable attributes.
-- 2. Apply Primary Key, Foreign Key, NOT NULL, UNIQUE, and DEFAULT constraints.
-- 3. Insert at least 5 books and 3 members.
-- 4. Display books belonging to a particular category.
-- 5. Update the availability status of a book.
-- 6. Delete a book based on its ID.
-- 7. Add a new column to the Book table using ALTER.
-- 8. Rename the Book table using RENAME.
-- 9. Display the records after performing the operations.

CREATE DATABASE librarymanage_db;
USE librarymanage_db;
DROP TABLE Book;
DROP  TABLE Member;
CREATE TABLE Book (
    Book_id INT PRIMARY KEY,
    Book_name VARCHAR(50) NOT NULL,
    Book_category VARCHAR(30) NOT NULL,
    Book_price INT NOT NULL,
    Availability VARCHAR(20) DEFAULT 'Available'
);

CREATE TABLE Member (
    Member_id INT PRIMARY KEY,
    Member_name VARCHAR(50) NOT NULL,
    Member_mail VARCHAR(50) UNIQUE NOT NULL,
    Book_id INT,
    FOREIGN KEY (Book_id) REFERENCES Book(Book_id)
);

INSERT INTO Book (Book_id, Book_name, Book_category, Book_price)
VALUES
(1, 'ADSA', 'Computer Science', 500),
(2, 'LTPS', 'Programming', 300),
(3, 'DBMS', 'Computer Science', 450),
(4, 'Mathematics', 'Mathematics', 350),
(5, 'English', 'Language', 200);

INSERT INTO Member (Member_id, Member_name, Member_mail, Book_id)
VALUES
(101, 'Hrithik', 'hrithik@gmail.com', 1),
(102, 'Rahul', 'rahul@gmail.com', 2),
(103, 'Aman', 'aman@gmail.com', NULL);

SELECT *
FROM Book
WHERE Book_category = 'Computer Science';

UPDATE Book
SET Availability = 'Not Available'
WHERE Book_id = 1;

UPDATE Member
SET Book_id = NULL
WHERE Book_id = 5;

DELETE FROM Book
WHERE Book_id = 5;

ALTER TABLE Book
ADD COLUMN Publisher VARCHAR(50) DEFAULT 'Unknown';

RENAME TABLE Book TO LibraryBook;

SELECT * FROM LibraryBook;

SELECT * FROM Member;