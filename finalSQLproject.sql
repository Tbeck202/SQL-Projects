CREATE DATABASE TA_Lib_Project;

--USE TA_Lib_Project

CREATE TABLE tbl_branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR (50) NOT NULL,
	BranchAddress VARCHAR (60) NOT NULL,
);

INSERT INTO tbl_branch
	(BranchName, BranchAddress)
	VALUES
	('Sharpstown', '123 s Main street'),
	('Central', '15 n Center street'),
	('Rose Park', '85 w Mason street'),
	('Mountain Shadows', '10 e Burnside street')
;

CREATE TABLE tbl_publisher (
	publisherName VARCHAR (50) PRIMARY KEY NOT NULL,
	pubAddress VARCHAR (50) NOT NULL,
	pubPhone VARCHAR (50) NOT NULL,
);

INSERT INTO tbl_publisher
	(publisherName, pubAddress, pubPhone)
	VALUES
	('Big Boy Books', '75 s State street', '(801)-555-5555'),
	('Paper People Publishing', '1355 e Vine street', '(801)-444-4444')
;

CREATE TABLE tbl_books (
	bookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	bookTitle VARCHAR (50) NOT NULL,
	bookPublisher VARCHAR (50) NOT NULL,
);

INSERT INTO tbl_books
	(bookTitle, bookPublisher)
	VALUES
	('Game of Thrones', 'Big Boy Books'),
	('Fight Club', 'Big Boy Books'),
	('The Gunslinger', 'Big Boy Books'),
	('The Alchemist', 'Paper People Publishing'),
	('Invisible Monsters', 'Big Boy Books'),
	('The Princess Bride', 'Paper People Publishing'),
	('The Curious Incident of the Dog in the Nighttime', 'Paper People Publishing'),
	('To Kill a Mockingbird', 'Paper People Publishing'),
	('Where the Wild Things Are', 'Paper People Publishing'),
	('Me Talk Pretty One Day', 'Paper People Publishing'),
	('A Heartbreaking Work of Staggering Genius', 'Paper People Publishing'),
	('Hitchhikers Guide to the Galaxy', 'Paper People Publishing'),
	('American Psycho', 'Big Boy Books'),
	('Fear and Loathing in Las Vegas', 'Big Boy Books'),
	('Post Office', 'Big Boy Books'),
	('No Country For Old Men', 'Big Boy Books'),
	('The Stand', 'Paper People Publishing'),
	('The Old Man and the Sea', 'Paper People Publishing'),
	('Factotum', 'Big Boy Books'),
	('The Lost Tribe', 'Paper People Publishing')
;

CREATE TABLE tbl_authors (
	bookID INT NOT NULL CONSTRAINT fk_bookID FOREIGN KEY REFERENCES tbl_books(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	authorName VARCHAR (30)
);

INSERT INTO tbl_authors
	(bookID, authorName)
	VALUES
	(1, 'George RR Martin'),
	(2, 'Chuck Palahniuk'),
	(3, 'Stephen King'),
	(4, 'Paulo Coelho'),
	(5, 'Chuck Palahniuk'),
	(6, 'William Goldman'),
	(7, 'Mark Haddon'),
	(8, 'Harper Lee'),
	(9, 'Maurice Sendak'),
	(10, 'David Sedaris'),
	(11, 'Dave Eggers'),
	(12, 'Douglas Adams'),
	(13, 'Bret Easton Ellis'),
	(14, 'Hunter S Thompson'),
	(15, 'Charles Bukowski'),
	(16, 'Cormac McCarthy'),
	(17, 'Stephen King'),
	(18, 'Ernest Hemingway'),
	(19, 'Charles Bukowski'),
	(20, 'Mark Lee')
;

CREATE TABLE tbl_bookCopies (
	bookCopyID INT NOT NULL CONSTRAINT fk_bookCopyID FOREIGN KEY REFERENCES tbl_books(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	branchID INT NOT NULL CONSTRAINT fk_brachID FOREIGN KEY REFERENCES tbl_branch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	numberOfCopies INT NOT NULL
);

INSERT INTO tbl_bookCopies
	(bookCopyID, branchID, numberOfCopies)
	VALUES
	(1, 1, 10),
	(2, 1, 10),
	(3, 1, 10),
	(4, 1, 10),
	(5, 1, 10),
	(6, 1, 10),
	(7, 1, 10),
	(8, 1, 10),
	(9, 1, 10),
	(10, 1, 10),
	(11, 1, 10),
	(12, 1, 10),
	(13, 1, 10),
	(14, 1, 10),
	(15, 1, 10),
	(16, 1, 10),
	(17, 1, 10),
	(18, 1, 10),
	(19, 1, 10),
	(20, 1, 10),
	(1, 2, 10),
	(2, 2, 10),
	(3, 2, 10),
	(4, 2, 10),
	(5, 2, 10),
	(6, 2, 10),
	(7, 2, 10),
	(8, 2, 10),
	(9, 2, 10),
	(10, 2, 10),
	(11, 2, 10),
	(12, 2, 10),
	(13, 2, 10),
	(14, 2, 10),
	(15, 2, 10),
	(16, 2, 10),
	(17, 2, 10),
	(18, 2, 10),
	(19, 2, 10),
	(20, 2, 10),
	(1, 3, 10),
	(2, 3, 10),
	(3, 3, 10),
	(4, 3, 10),
	(5, 3, 10),
	(6, 3, 10),
	(7, 3, 10),
	(8, 3, 10),
	(9, 3, 10),
	(10, 3, 10),
	(11, 3, 10),
	(12, 3, 10),
	(13, 3, 10),
	(14, 3, 10),
	(15, 3, 10),
	(16, 3, 10),
	(17, 3, 10),
	(18, 3, 10),
	(19, 3, 10),
	(20, 3, 10),
	(1, 4, 10),
	(2, 4, 10),
	(3, 4, 10),
	(4, 4, 10),
	(5, 4, 10),
	(6, 4, 10),
	(7, 4, 10),
	(8, 4, 10),
	(9, 4, 10),
	(10, 4, 10),
	(11, 4, 10),
	(12, 4, 10),
	(13, 4, 10),
	(14, 4, 10),
	(15, 4, 10),
	(16, 4, 10),
	(17, 4, 10),
	(18, 4, 10),
	(19, 4, 10),
	(20, 4, 10)
;

CREATE TABLE tbl_borrower (
	cardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	borrowerName VARCHAR (50) NOT NULL,
	borrowerAddress VARCHAR (50) NOT NULL,
	borrowerPhone VARCHAR (15) NOT NULL
);

INSERT INTO tbl_borrower 
	(borrowerName, borrowerAddress, borrowerPhone)
	VALUES
	('Donovan Mitchell', '45 e Dunk street', '(801) 450-4545'),
	('Rudy Gobert', '27 n Block avenue', '(801) 270-2727'),
	('Joe Ingles', '2 e Three Point drive', '(801) 200-0202'),
	('Bojan bogdanovic', '44 s Corner Three street', '(801)-440-4444'),
	('Mike Conley', '10 w Assist lane', '(801) 100-1010'),
	('Dante Exum', '11 e Speedy street', '(801) 110-1111'),
	('Royce O Neale', '23 w Hustle street', '(801) 230-2323'),
	('Ed Davis', '17 n Rebound ave', '(801) 170-1717'),
	('Jeff Green', '32 s Veteran lane', '(801) 320-3232'),
	('Georges Niang', '31 n Hype circle', '(801) 310-3131')
;
	 
CREATE TABLE tbl_bookLoans (
	bookLoanID INT NOT NULL CONSTRAINT fk_bookLoanID FOREIGN KEY REFERENCES tbl_books(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	branchLoanID INT NOT NULL CONSTRAINT fk_brachLoanID FOREIGN KEY REFERENCES tbl_books(bookID) ON UPDATE NO ACTION ON DELETE NO ACTION,
	cardNo INT NOT NULL CONSTRAINT fk_cardNo FOREIGN KEY REFERENCES tbl_borrower(cardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	dateOut DATE NOT NULL,
	dateDue DATE NOT NULL
);

INSERT INTO tbl_bookLoans
	(bookLoanID, branchLoanID, cardNo, dateOut, dateDue)
	VALUES
	(1, 1, 1, '2019-07-15', '2019-08-15'),
	(1, 2, 4, '2019-07-02', '2019-08-02'),
	(1, 3, 7, '2019-06-12', '2019-07-15'),
	(1, 4, 2, '2019-07-10', '2019-08-10'),
	(2, 4, 9, '2019-07-02', '2019-08-02'),
	(2, 3, 7, '2019-06-22', '2019-07-22'),
	(2, 2, 4, '2019-07-02', '2019-08-02'),
	(2, 1, 1, '2019-07-15', '2019-08-15'),
	(3, 3, 7, '2019-06-22', '2019-07-22'),
	(3, 2, 4, '2019-07-02', '2019-08-02'),
	(4, 4, 2, '2019-07-10', '2019-08-10'),
	(4, 1, 1, '2019-07-15', '2019-08-15'),
	(4, 3, 3, '2019-07-11', '2019-08-11'),
	(5, 1, 9, '2019-07-02', '2019-08-02'),
	(5, 2, 9, '2019-07-02', '2019-08-02'),
	(5, 3, 3, '2019-07-11', '2019-08-11'),
	(6, 2, 9, '2019-07-02', '2019-08-02'),
	(6, 4, 1, '2019-07-19', '2019-08-19'),
	(7, 3, 2, '2019-07-10', '2019-08-10'),
	(7, 1, 1, '2019-07-15', '2019-08-15'),
	(7, 2, 1, '2019-07-20', '2019-08-20'),
	(8, 4, 2, '2019-07-10', '2019-08-10'),
	(8, 1, 9, '2019-07-02', '2019-08-02'),
	(9, 1, 1, '2019-07-15', '2019-08-15'),
	(9, 2, 2, '2019-07-12', '2019-08-12'),
	(9, 3, 3, '2019-07-11', '2019-08-11'),
	(10, 2, 9, '2019-07-02', '2019-08-02'),
	(10, 4, 2, '2019-07-10', '2019-08-10'),
	(11, 3, 3, '2019-07-11', '2019-08-11'),
	(11, 4, 2, '2019-07-10', '2019-08-10'),
	(12, 4, 8, '2019-07-15', '2019-08-15'),
	(12, 1, 6, '2019-06-20', '2019-07-20'),
	(13, 1, 6, '2019-06-20', '2019-07-20'),
	(13, 2, 3, '2019-07-11', '2019-08-11'),
	(13, 4, 4, '2019-07-02', '2019-08-02'),
	(14, 1, 6, '2019-06-20', '2019-07-20'),
	(14, 2, 4, '2019-07-02', '2019-08-02'),
	(14, 3, 3, '2019-07-11', '2019-08-11'),
	(15, 1, 1, '2019-07-15', '2019-08-15'),
	(15, 3, 3, '2019-07-11', '2019-08-11'),
	(16, 4, 8, '2019-07-15', '2019-08-15'),
	(17, 1, 5, '2019-07-01', '2019-08-01'),
	(17, 2, 6, '2019-06-20', '2019-07-20'),
	(17, 3, 5, '2019-07-01', '2019-08-01'),
	(17, 4, 2, '2019-07-10', '2019-08-10'),
	(18, 2, 7, '2019-06-22', '2019-07-22'),
	(18, 3, 5, '2019-07-01', '2019-08-01'),
	(18, 4, 8, '2019-07-15', '2019-08-15'),
	(19, 3, 3, '2019-07-11', '2019-08-11'),
	(19, 4, 8, '2019-07-15', '2019-08-15'),
	(20, 1, 1, '2019-07-15', '2019-08-15'),
	(20, 2, 8, '2019-07-15', '2019-08-15'),
	(20, 3, 5, '2019-07-01', '2019-08-01'),
	(20, 4, 2, '2019-07-10', '2019-08-10')
;
	
