/* CREATE DATABASE */

CREATE DATABASE db_LibraryManagement;



/* CREATE TABLES */
USE db_LibraryManagement;

CREATE TABLE tbl_LibraryBranch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_Name VARCHAR(50) NOT NULL,
	branch_Address VARCHAR(70) NOT NULL
);

CREATE TABLE tbl_Publisher (
	publisher_Name VARCHAR(50) NOT NULL,
	publisher_Address VARCHAR(70) NOT NULL,
	publisher_Phone VARCHAR(50) NOT NULL,
	PRIMARY KEY (publisher_Name)
);

CREATE TABLE tbl_Books (
	books_BookID INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	books_Title VARCHAR(70) NOT NULL,
	books_PublisherName VARCHAR(50) NOT NULL,
	FOREIGN KEY (books_PublisherName) REFERENCES tbl_Publisher (publisher_Name)
);

CREATE TABLE tbl_BookAuthors (
	authors_BookID INT NOT NULL,
	authors_AuthorName VARCHAR(50) NOT NULL,
	FOREIGN KEY (authors_BookID) REFERENCES tbl_Books (books_BookID)
);

CREATE TABLE tbl_BookCopies (
	copies_BookID INT NOT NULL,
	copies_BranchID INT NOT NULL,
	copies_NumberOfCopies INT NOT NULL,
	FOREIGN KEY (copies_BranchID) REFERENCES tbl_LibraryBranch (branch_ID),
	FOREIGN KEY (copies_BookID) REFERENCES tbl_Books (books_BookID)
);

CREATE TABLE tbl_BookLoans (
	loans_BookID INT NOT NULL,
	loans_BranchID INT NOT NULL,
	loans_CardNo INT NOT NULL,
	loans_DateOut DATE NOT NULL,
	loans_DateDue DATE NOT NULL,
	PRIMARY KEY (loans_CardNo),
	FOREIGN KEY (loans_BookID) REFERENCES tbl_Books (books_BookID),
	FOREIGN KEY (loans_BranchID) REFERENCES tbl_LibraryBranch (branch_ID)
);

CREATE TABLE tbl_Borrowers (
	borrower_CardNo INT,
	borrower_Name VARCHAR(50) NOT NULL,
	borrower_Address VARCHAR(70) NOT NULL,
	borrower_Phone VARCHAR (50) NOT NULL,
	FOREIGN KEY (borrower_CardNo) REFERENCES tbl_BookLoans (loans_CardNo)
);


/* INSERT DATA INTO TABLES */

INSERT INTO tbl_LibraryBranch
	(branch_Name, branch_Address)
	VALUES
	('Sharpstown', 'Sharpstown, City, State, Zip'),
	('Central', 'Central, City, State, Zip'),
	('North', 'North, City, State, Zip'),
	('South', 'South, City, State, Zip'),
	('East', 'East, City, State, Zip'),
	('West', 'West, City, State, Zip')
;

SELECT * FROM tbl_LibraryBranch;

INSERT INTO tbl_Publisher
	(publisher_Name, publisher_address, publisher_phone)
	VALUES
	('Publisher 1', '1231 A St.', '123-456-7890'),
	('Publisher 2', '1232 B St.', '123-456-7891'),
	('Publisher 3', '1234 C St.', '123-456-7892'),
	('Publisher 4', '1233 D St.', '123-456-7893'),
	('Publisher 5', '1234 E St.', '123-456-7894'),
	('Publisher 6', '1235 F St.', '123-456-7895'),
	('Publisher 7', '1236 G St.', '123-456-7896')
;

SELECT * FROM tbl_Publisher;

INSERT INTO tbl_Books
	(books_Title, books_PublisherName)
	VALUES
	('The Lost Tribe', 'Publisher 1'),
	('The Great Gatsby', 'Publisher 1'),
	('Moby Dick', 'Publisher 1'),
	('Hamlet', 'Publisher 1'),
	('War and Peace', 'Publisher 2'),
	('The Oddysey', 'Publisher 2'),
	('One Hundered Years of Solitude', 'Publisher 2'),
	('The Divine Comedy', 'Publisher 3'),
	('The Adventures of Huckleberry Finn', 'Publisher 2'),
	('Alices Adventures in Wonderland', 'Publisher 2'),
	('Wuthering Heights', 'Publisher 3'),
	('Pride and Prejudice', 'Publisher 3'),
	('Emma', 'Publisher 3'),
	('Mansfield Park', 'Publisher 3'),
	('The Catcher in the Rye', 'Publisher 1'),
	('Harry Potter and the Sorcers Stone', 'Publisher 4'),
	('Harry Potter and the Chamber of Secrets', 'Publisher 4'),
	('Harry Potter and the Prizoner of Azkaban', 'Publisher 4'),
	('Harry Potter and the Goblet of Fire', 'Publisher 4'),
	('Harry Potter and the Order of the Phoenix', 'Publisher 4'),
	('Harry Potter and the Half-Blood Prince', 'Publisher 4'),
	('Harry Potter and the Deathly Hollows', 'Publisher 4'),
	('The Lord of the Rings', 'Publisher 5'),
	('The Hobbit', 'Publisher 5'),
	('Carrie', 'Publisher 6'),
	('Salems Lot', 'Publisher 6'),
	('The Shining', 'Publisher 6'),
	('The Stand', 'Publisher 6'),
	('The Dead Zone', 'Publisher 6'),
	('The Rising Sea', 'Publisher 7'),
	('Ghost Ship', 'Publisher 7'),
	('Zero Hour', 'Publisher 7'),
	('Sea of Greed', 'Publisher 7')
;

SELECT * FROM tbl_Books;

INSERT INTO tbl_BookAuthors
	(authors_BookID, authors_AuthorName)
	VALUES
	('1000', 'TA Author'),
	('1001', 'F. Scott Fitzgerald'),
	('1002', 'Herman Melville'),
	('1003', 'William Shakespeare'),
	('1004', 'Leo Tolstoy'),
	('1005', 'Homer'),
	('1006', 'Gabriel Garcia Marquez'),
	('1007', 'Dante Alighieri'),
	('1008', 'Mark Twain'),
	('1009', 'Lewis Carroll'),
	('1010', 'Emily Bronte'),
	('1011', 'Jane Austen'),
	('1012', 'Jane Austen'),
	('1013', 'Jane Austen'),
	('1014', 'J.D. Salinger'),
	('1015', 'J.K. Rowling'),
	('1016', 'J.K. Rowling'),
	('1017', 'J.K. Rowling'),
	('1018', 'J.K. Rowling'),
	('1019', 'J.K. Rowling'),
	('1020', 'J.K. Rowling'),
	('1021', 'J.K. Rowling'),
	('1022', 'J.R.R. Tolkien'),
	('1023', 'J.R.R. Tolkien'),
	('1024', 'Stephen King'),
	('1025', 'Stephen King'),
	('1026', 'Stephen King'),
	('1027', 'Stephen King'),
	('1028', 'Stephen King'),
	('1029', 'Clive Cussler'),
	('1030', 'Clive Cussler'),
	('1031', 'Clive Cussler'),
	('1032', 'Clive Cussler')
;

SELECT * FROM tbl_BookAuthors;

INSERT INTO tbl_BookCopies
	(copies_BookID, copies_BranchID, copies_NumberOfCopies)
	VALUES
	(1000, 1, 4),
	(1001, 1, 5),
	(1002, 1, 7),
	(1003, 1, 2),
	(1004, 1, 3),
	(1005, 1, 4),
	(1006, 1, 8),
	(1007, 1, 2),
	(1008, 1, 4),
	(1009, 1, 5),
	(1023, 2, 4),
	(1024, 2, 5),
	(1025, 2, 3),
	(1026, 2, 4),
	(1027, 2, 7),
	(1028, 2, 8),
	(1029, 2, 3),
	(1030, 2, 4),
	(1031, 2, 5),
	(1032, 2, 3),
	(1010, 2, 3),
	(1011, 2, 4),
	(1012, 2, 6),
	(1013, 3, 3),
	(1014, 3, 4),
	(1015, 3, 4),
	(1016, 3, 4),
	(1017, 3, 4),
	(1018, 3, 4),
	(1019, 3, 4),
	(1020, 3, 4),
	(1021, 3, 7),
	(1022, 3, 5),
	(1023, 3, 2),
	(1024, 3, 3),
	(1032, 4, 3),
	(1000, 4, 4),
	(1001, 4, 5),
	(1002, 4, 7),
	(1003, 4, 2),
	(1004, 4, 3),
	(1005, 4, 4),
	(1006, 4, 8),
	(1007, 4, 2),
	(1008, 4, 4),
	(1009, 4, 5),
	(1023, 5, 4),
	(1024, 5, 5),
	(1025, 5, 3),
	(1026, 5, 4),
	(1027, 5, 7),
	(1028, 5, 8),
	(1029, 5, 3),
	(1030, 5, 4),
	(1031, 5, 5),
	(1010, 5, 3),
	(1011, 5, 4),
	(1012, 5, 6),
	(1013, 6, 3),
	(1014, 6, 4),
	(1015, 6, 4),
	(1016, 6, 4),
	(1017, 6, 4),
	(1018, 6, 4),
	(1019, 6, 4),
	(1020, 6, 4),
	(1021, 6, 7),
	(1022, 6, 5),
	(1023, 6, 2),
	(1024, 6, 3)
;

SELECT * FROM tbl_BookCopies;

INSERT INTO tbl_BookLoans
	(loans_BookID, loans_BranchID, loans_CardNo, loans_DateOut, loans_DateDue)
	VALUES
	(1032, 1, 1, '2019-07-01', '2019-08-19'),
	(1001, 1, 2, '2019-07-01', '2019-08-19'),
	(1002, 1, 3, '2019-07-01', '2019-08-20'),
	(1003, 1, 4, '2019-07-01', '2019-08-20'),
	(1000, 1, 5, '2019-07-01', '2019-10-01'),
	(1001, 1, 6, '2019-07-01', '2019-10-01'),
	(1002, 1, 7, '2019-07-01', '2019-10-01'),
	(1003, 1, 8, '2019-07-01', '2019-10-01'),
	(1006, 1, 9, '2019-07-01', '2019-10-01'),
	(1024, 2, 10, '2019-07-01', '2019-10-01'),
	(1024, 2, 11, '2019-07-01', '2019-10-01'),
	(1025, 2, 12, '2019-07-01', '2019-10-01'),
	(1026, 2, 13, '2019-07-01', '2019-10-01'),
	(1027, 2, 14, '2019-07-01', '2019-10-01'),
	(1026, 2, 15, '2019-07-01', '2019-10-01'),
	(1029, 2, 16, '2019-07-01', '2019-10-01'),
	(1028, 2, 17, '2019-07-01', '2019-10-01'),
	(1030, 2, 18, '2019-07-01', '2019-10-01'),
	(1031, 2, 19, '2019-07-01', '2019-10-01'),
	(1025, 2, 20, '2019-07-01', '2019-10-01'),
	(1013, 3, 21, '2019-07-01', '2019-10-01'),
	(1014, 3, 22, '2019-07-01', '2019-10-01'),
	(1015, 3, 23, '2019-07-01', '2019-10-01'),
	(1016, 3, 24, '2019-07-01', '2019-10-01'),
	(1017, 3, 25, '2019-07-01', '2019-10-01'),
	(1019, 3, 26, '2019-07-01', '2019-10-01'),
	(1019, 3, 27, '2019-07-01', '2019-10-01'),
	(1014, 3, 28, '2019-07-01', '2019-10-01'),
	(1017, 3, 29, '2019-07-01', '2019-10-01'),
	(1016, 3, 30, '2019-07-01', '2019-10-01'),
	(1017, 3, 31, '2019-07-01', '2019-10-01'),
	(1019, 3, 32, '2019-07-01', '2019-10-01'),
	(1005, 4, 33, '2019-07-01', '2019-10-01'),
	(1005, 4, 34, '2019-07-01', '2019-10-01'),
	(1006, 4, 35, '2019-07-01', '2019-10-01'),
	(1006, 4, 36, '2019-07-01', '2019-10-01'),
	(1007, 4, 37, '2019-07-01', '2019-10-01'),
	(1007, 4, 38, '2019-07-01', '2019-10-01'),
	(1008, 4, 39, '2019-07-01', '2019-10-01'),
	(1008, 4, 40, '2019-07-01', '2019-10-01'),
	(1009, 4, 41, '2019-07-01', '2019-10-01'),
	(1009, 4, 42, '2019-07-01', '2019-10-01'),
	(1009, 4, 43, '2019-07-01', '2019-10-01'),
	(1000, 5, 44, '2019-07-01', '2019-10-01'),
	(1025, 5, 45, '2019-07-01', '2019-10-01'),
	(1024, 5, 46, '2019-07-01', '2019-10-01'),
	(1023, 5, 47, '2019-07-01', '2019-10-01'),
	(1030, 5, 48, '2019-07-01', '2019-10-01'),
	(1029, 5, 49, '2019-07-01', '2019-10-01'),
	(1028, 6, 50, '2019-07-01', '2019-10-01'),
	(1019, 6, 51, '2019-07-01', '2019-10-01'),
	(1019, 6, 52, '2019-07-01', '2019-10-01'),
	(1017, 6, 53, '2019-07-01', '2019-10-01'),
	(1017, 6, 54, '2019-07-01', '2019-10-01'),
	(1018, 6, 55, '2019-07-01', '2019-10-01')
;

SELECT * FROM tbl_BookLoans;

INSERT INTO tbl_Borrowers
	(borrower_CardNo, borrower_Name, borrower_Address, borrower_Phone)
	VALUES
	(1, 'Bob Smith', '5678 Z St.', '987-654-3210'),
	(2, 'Bob Smith', '5678 Z St.', '987-654-3210'),
	(3, 'Bob Smith', '5678 Z St.', '987-654-3210'),
	(4, 'Bob Smith', '5678 Z St.', '987-654-3210'),
	(5, 'Bob Smith', '5678 Z St.', '987-654-3210'),
	(6, 'Bob Smith', '5678 Z St.', '987-654-3210'),
	(7, 'Bob Smith', '5678 Z St.', '987-654-3210'),
	(10, 'John Doe', '5679 Y St.', '987-654-3211'),
	(11, 'John Doe', '5679 Y St.', '987-654-3211'),
	(12, 'John Doe', '5679 Y St.', '987-654-3211'),
	(13, 'John Doe', '5679 Y St.', '987-654-3211'),
	(14, 'John Doe', '5679 Y St.', '987-654-3211'),
	(15, 'John Doe', '5679 Y St.', '987-654-3211'),
	(16, 'John Doe', '5679 Y St.', '987-654-3211'),
	(20, 'Jane Doe', '5670 X St.', '987-654-3212'),
	(21, 'Jane Doe', '5670 X St.', '987-654-3212'),
	(22, 'Jane Doe', '5670 X St.', '987-654-3212'),
	(8, 'Harry Houdini', '5671 W St.', '987-654-3213'),
	(9, 'Harry Houdini', '5671 W St.', '987-654-3213'),
	(17, 'George Washington', '5672 V St.', '987-654-3214'),
	(18, 'George Washington', '5672 V St.', '987-654-3214'),
	(19, 'George Washington', '5672 V St.', '987-654-3214'),
	(23, 'Abraham Lincoln', '5673 U St.', '987-654-3215'),
	(24,'Abraham Lincoln', '5673 U St.', '987-654-3215'),
	(30, 'Abigail Adams', '5674 T St.', '987-654-3216'),
	(31, 'Abigail Adams', '5674 T St.', '987-654-3216'),
	(45, 'Betsy Ross', '5675 S St.', '987-654-3217'),
	(46, 'Betsy Ross', '5675 S St.', '987-654-3217'),
	(51, 'Ben Franklin', '5676 R St.', '987-654-3218'),
	(52, 'Ben Franklin', '5676 R St.', '987-654-3218')
;

SELECT * FROM tbl_Borrowers;

INSERT INTO tbl_Borrowers
	(borrower_Name, borrower_Address, borrower_Phone)
	VALUES
	('James Madison', '5677 Q St.', '987-654-3219'),
	('Thomas Jefferson', '5678 P St.', '987-654-3220'),
	('Jackie O.', '5679 O St.', '987-654-3221')
;

SELECT * FROM tbl_Borrowers;



/* CREATE PROCEDURES */

/* 1) How many copies of The Lost Tribe are owned by the Sharpstown Library Branch? */

USE db_LibraryManagement GO

CREATE PROCEDURE Procedure_1 @BranchName varchar(50), @BookTitle varchar(50)
AS
BEGIN 
SELECT copies_NumberOfCopies AS 'Number of Copies: ', branch_Name AS 'Branch Name: ', books_Title AS 'Book Title: '
FROM tbl_BookCopies
INNER JOIN tbl_LibraryBranch on branch_ID = copies_BranchID
INNER JOIN tbl_Books on books_BookID = copies_BookID
WHERE branch_Name = @BranchName
AND books_Title = @BookTitle;
END
GO

EXEC dbo.Procedure_1 @BranchName = 'Sharpstown', @BookTitle = 'The Lost Tribe';


/* 2)How many copies of the The Lost Tribe are owned by each Library Branch? */

USE db_LibraryManagement GO

CREATE PROCEDURE Procedure_2 @BookTitle varchar(50)
AS
BEGIN 
SELECT copies_NumberOfCopies AS 'Number of Copies: ', branch_Name AS 'Branch Name: ', books_Title AS 'Book Title: '
FROM tbl_BookCopies
INNER JOIN tbl_LibraryBranch on branch_ID = copies_BranchID
INNER JOIN tbl_Books on books_BookID = copies_BookID
WHERE books_Title = @BookTitle;
END
GO

EXEC dbo.Procedure_2 @BookTitle = 'The Lost Tribe';


/* 3) Retrieve the names of all borrowers who do not have any books checked out. */

USE db_LibraryManagement GO

CREATE PROCEDURE Procedure_3
AS
BEGIN 
SELECT borrower_Name AS 'Borrower Name: ' FROM tbl_Borrowers WHERE borrower_CardNo is NULL;
END
GO

SELECT * FROM tbl_Borrowers;
/* 4) Retrieve the book title, borrower's name, and borrower's address for books loaned out from
	  the Sharpstown Library that have a DueDate of today. */
USE db_LibraryManagement GO

CREATE PROCEDURE Procedure_4 @BranchName varchar(30), @Date DATE
AS
BEGIN 
SELECT branch_Name AS 'Library Branch Name: ', 
books_Title AS 'Book Title: ', 
borrower_Name AS 'Borrower Name: ', 
borrower_Address AS 'Borrower Address: ',
loans_DateDue AS 'Due Date: '
FROM tbl_BookLoans
INNER JOIN tbl_LibraryBranch on branch_ID = loans_BranchID
INNER JOIN tbl_Books on books_BookID = loans_BookID
INNER JOIN tbl_Borrowers on borrower_CardNo = loans_CardNo
WHERE branch_Name = @BranchName
AND loans_DateDue = @Date;
END
GO

EXEC dbo.Procedure_4 @BranchName = 'Sharpstown', @Date = '2019-08-19';

/* 5)Retrieve the branch name and total number of books loaned out for EACH branch. */

USE db_LibraryManagement GO

CREATE PROCEDURE Procedure_5
AS
BEGIN 
SELECT branch_Name AS 'Library Branch Name: ',  COUNT (*) loans_CardNo
FROM tbl_LibraryBranch
INNER JOIN tbl_BookLoans ON branch_ID = loans_BranchID
GROUP BY branch_Name;
END
GO

EXEC dbo.Procedure_5;

/* 6) Retrieve the names, addresses, and the number of books checked out for all borrowers
	  who have more than 5 books checked out. */

USE db_LibraryManagement GO

CREATE PROCEDURE Procedure_6
AS
BEGIN
SELECT borrower_Name AS 'Borrower Name: ', borrower_Address AS 'Borrower Address: ', COUNT (*) borrower_CardNo
FROM tbl_Borrowers
GROUP BY borrower_Name, borrower_Address
HAVING  COUNT(*) >= 5 ;
END
GO

EXEC dbo.Procedure_6;

/* 7) For each book authored (or co-authored) by Stephen King, retrieve the title and number
	  of copies owned by the "Central" library branch. */

USE db_LibraryManagement GO

CREATE PROCEDURE Procedure_7 @AuthorName varchar(30), @BranchName varchar(20)
AS
BEGIN
SELECT books_Title AS 'Title: ', tbl_BookCopies.copies_NumberOfCopies AS 'Number of Copies: '
FROM tbl_BookCopies
INNER JOIN tbl_Books ON books_BookID = copies_BookID
INNER JOIN tbl_BookAuthors ON authors_BookID = copies_BookID
INNER JOIN tbl_LibraryBranch ON branch_ID = copies_BranchID
WHERE authors_AuthorName = @AuthorName
AND branch_Name = @BranchName;
END
GO

EXEC dbo.Procedure_7 @AuthorName = 'Stephen King', @BranchName = 'Central';
