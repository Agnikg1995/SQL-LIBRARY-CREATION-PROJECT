-- Create the database named 'library' if it doesn't exist
CREATE DATABASE IF NOT EXISTS library;

-- Use the 'library' database
USE library;

-- 1. Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(15)
);

-- 2. Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- 3. Books table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);

-- 4. Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(100),
    Reg_date DATE
);

-- 5. IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- 6. ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
-- Inserting sample data into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
    (1, 1, '123 Main St, Anytown, USA', '+1-123-456-7890'),
    (2, 2, '456 Oak Ave, Sometown, USA', '+1-234-567-8901'),
    (3, 3, '789 Pine Blvd, Othertown, USA', '+1-345-678-9012');

-- Inserting sample data into Employee table

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES (1, 'John Doe', 'Manager', 60000.00, 1),
    (2, 'Jane Smith', 'Assistant Manager', 50000.00, 1),
    (3, 'Michael Johnson', 'Librarian', 45000.00, 2),
    (4, 'Emily Brown', 'Clerk', 40000.00, 2),
    (5, 'David Wilson', 'Clerk', 38000.00, 1),
    (6, 'Sarah Lee', 'Assistant Librarian', 42000.00, 3),
    (7, 'James Davis', 'Clerk', 38000.00, 3),
    (8, 'Emma Martinez', 'Clerk', 39000.00, 2),
    (9, 'Ryan Garcia', 'Assistant Librarian', 43000.00, 1),
    (10, 'Olivia Lopez', 'Clerk', 38000.00, 3),
    (11, 'Sophie Brown', 'Clerk', 38000.00, 1),
    (12, 'Emma Wilson', 'Clerk', 39000.00, 1),
    (13, 'Lucas Davis', 'Assistant Manager', 55000.00, 2),
    (14, 'Olivia Lee', 'Librarian', 48000.00, 2),
    (15, 'Aiden Martinez', 'Clerk', 40000.00, 2),
    (16, 'Mia Garcia', 'Assistant Librarian', 42000.00, 3),
    (17, 'Noah Thomas', 'Clerk', 38000.00, 3),
    (18, 'Isabella Johnson', 'Manager', 60000.00, 1),
    (19, 'James Smith', 'Clerk', 38000.00, 3),
    (20, 'Sophia Brown', 'Clerk', 39000.00, 1);
-- Inserting sample data into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
    ('9780061120084', 'To Kill a Mockingbird', 'Fiction', 12.99, 'yes', 'Harper Lee', 'Harper Perennial Modern Classics'),
    ('9780141439563', '1984', 'Science Fiction', 9.99, 'yes', 'George Orwell', 'Penguin Books'),
    ('9780743273565', 'The Great Gatsby', 'Classic Literature', 10.99, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
    ('9780345342966', 'Fahrenheit 451', 'Science Fiction', 11.99, 'yes', 'Ray Bradbury', 'Ballantine Books'),
    ('9780553212419', 'Pride and Prejudice', 'Classic Literature', 8.99, 'yes', 'Jane Austen', 'Bantam Classics'),
    ('9780062315007', 'Gone Girl', 'Mystery', 14.99, 'yes', 'Gillian Flynn', 'Broadway Books'),
    ('9781451626650', 'The Help', 'Fiction', 13.99, 'yes', 'Kathryn Stockett', 'Berkley Books'),
    ('9780385534635', 'The Goldfinch', 'Contemporary Fiction', 16.99, 'yes', 'Donna Tartt', 'Little, Brown and Company'),
    ('9780385472578', 'Brave New World', 'Science Fiction', 10.99, 'yes', 'Aldous Huxley', 'Harper Perennial Modern Classics'),
    ('9780446310789', 'To Kill a Mockingbird', 'Fiction', 12.99, 'yes', 'Harper Lee', 'Harper Perennial Modern Classics');
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
    ('9780061492183', 'A Short History of Nearly Everything', 'History', 15.99, 'yes', 'Bill Bryson', 'Broadway Books'),
    ('9780143037752', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 17.99, 'yes', 'Jared Diamond', 'W. W. Norton & Company');
    INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
    ('9780307590613', 'The Girl with the Dragon Tattoo', 'Mystery', 29.99, 'yes', 'Stieg Larsson', 'Knopf'),
    ('9781400079986', 'The Kite Runner', 'Fiction', 26.99, 'yes', 'Khaled Hosseini', 'Riverhead Books');
-- Inserting sample data into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
    (1, 'Alice Johnson', '123 Main St, Anytown, USA', '2023-05-15'),
    (2, 'Bob Smith', '456 Oak Ave, Sometown, USA', '2023-06-20'),
    (3, 'Eva Brown', '789 Pine Blvd, Othertown, USA', '2023-07-10'),
    (4, 'Charlie Wilson', '321 Elm Dr, Yourtown, USA', '2023-04-01'),
    (5, 'Grace Lee', '654 Cedar Ln, Anothertown, USA', '2023-03-12'),
    (6, 'Henry Davis', '987 Birch Rd, Newtown, USA', '2023-02-18'),
    (7, 'Sophia Martinez', '234 Maple Ave, Lasttown, USA', '2023-01-05'),
    (8, 'Lucas Thomas', '567 Walnut St, Thistown, USA', '2023-08-22'),
    (9, 'Isabella Perez', '876 Hickory Ct, Hometown, USA', '2023-09-14'),
    (10, 'Alexander Garcia', '109 Pinepple Dr, Anytown, USA', '2023-10-30');
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
    (11, 'Sophie Turner', '789 Elm St, Somecity, USA', '2021-12-15');
-- Inserting sample data into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
    (1, 1, 'To Kill a Mockingbird', '2023-05-20', '9780061120084'),
    (2, 2, '1984', '2023-06-25', '9780141439563'),
    (3, 3, 'The Great Gatsby', '2023-07-15', '9780743273565'),
    (4, 4, 'Fahrenheit 451', '2023-04-05', '9780345342966'),
    (5, 5, 'Pride and Prejudice', '2023-03-15', '9780553212419'),
    (6, 6, 'Gone Girl', '2023-02-18', '9780062315007'),
    (7, 7, 'The Help', '2023-01-10', '9781451626650'),
    (8, 8, 'The Goldfinch', '2023-08-22', '9780385534635'),
    (9, 9, 'Brave New World', '2023-09-14', '9780385472578'),
    (10, 10, 'To Kill a Mockingbird', '2023-10-30', '9780446310789');
    INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
    (11, 1, 'The Girl with the Dragon Tattoo', '2023-05-20', '9780307590613'),
    (12, 2, 'The Kite Runner', '2023-06-25', '9781400079986');

-- Inserting sample data into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
    (1, 1, 'To Kill a Mockingbird', '2023-06-10', '9780061120084'),
    (2, 2, '1984', '2023-07-05', '9780141439563'),
    (3, 3, 'The Great Gatsby', '2023-08-25', '9780743273565'),
    (4, 4, 'Fahrenheit 451', '2023-05-15', '9780345342966'),
    (5, 5, 'Pride and Prejudice', '2023-04-30', '9780553212419'),
    (6, 6, 'Gone Girl', '2023-03-20', '9780062315007'),
    (7, 7, 'The Help', '2023-02-10', '9781451626650'),
    (8, 8, 'The Goldfinch', '2023-09-02', '9780385534635'),
    (9, 9, 'Brave New World', '2023-10-01', '9780385472578'),
    (10, 10, 'To Kill a Mockingbird', '2023-11-15', '9780446310789');
-- Query 1: List books that are available (Status = 'yes')
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

-- Query 2: List employees sorted by salary in descending order
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- Query 3: List books issued along with the customer names
SELECT b.Book_title, c.Customer_name
FROM Books b
JOIN IssueStatus i ON b.ISBN = i.Isbn_book
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- Query 4: Count of books by category
SELECT Category, COUNT(*) AS Total_Count
FROM Books
GROUP BY Category;

-- Query 5: List employees earning more than 50000
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

-- Query 6: List customers who have not issued any books before 2022
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (
    SELECT Issued_cust
    FROM IssueStatus
);

-- Query 7: Count of employees in each branch
SELECT e.Branch_no, COUNT(*) AS Total_Employees
FROM Employee e
GROUP BY e.Branch_no;

-- Query 8: List customers who issued books in June 2023
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE YEAR(i.Issue_date) = 2023 AND MONTH(i.Issue_date) = 6;

-- Query 9: List books in the 'History' category
SELECT Book_title
FROM Books
WHERE Category = 'History';

-- Query 10: Count employees in each branch where the count is more than 5
SELECT e.Branch_no, COUNT(*) AS Employee_Count
FROM Employee e
GROUP BY e.Branch_no
HAVING COUNT(*) > 5;

-- Query 11: List managers and their branch addresses
SELECT e.Emp_name AS Employee_Name, b.Branch_address AS Branch_Address
FROM Employee e
JOIN Branch b ON e.Branch_no = b.Branch_no
WHERE e.Position = 'Manager';

-- Query 12: List customers who rented books with rental price greater than 25
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
JOIN Books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 25;



