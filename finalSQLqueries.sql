
--Procedure 1
USE TA_Lib_Project
GO
CREATE PROCEDURE proc_getCopies_byNameAndBranch @bookTitle nvarchar(30) = NULL, @branchName nvarchar(30) = NULL
AS
SELECT
a1.numberOfCopies, a2.bookTitle, a3.branchName
	FROM  tbl_bookCopies a1
	INNER JOIN tbl_books a2 ON a2.bookID = a1.bookCopyID
	INNER JOIN tbl_branch a3 ON a3.BranchID = a1.branchID
	WHERE bookTitle = ISNULL(@bookTitle, bookTitle) AND BranchName = ISNULL(@branchName, BranchName)
GO

--EXEC proc_getCopies_byNameAndBranch @bookTitle = 'The Lost Tribe', @branchName = 'Sharpstown'

--Procedure 2

CREATE PROC getCopiesByBranch @bookTitle nvarchar(50) = NULL
AS
SELECT
	a1.numberOfCopies, a2.bookTitle, a3.BranchName
	FROM tbl_bookCopies a1
	INNER JOIN tbl_books a2 ON a2.bookID = a1.bookCopyID
	INNER JOIN tbl_branch a3 ON a3.BranchID = a1.branchID
	WHERE bookTitle = ISNULL(@bookTitle, bookTitle)
GO

--EXEC getCopiesByBranch @bookTitle = 'The Lost Tribe'

-- Procedure 3

CREATE PROC findBorrowerWithNoLoans
AS
SELECT a1.borrowerName FROM tbl_borrower a1
	LEFT JOIN tbl_bookLoans a2 ON a1.cardNo = a2.cardNo
	WHERE a2.cardNo IS NULL
GO
	
--EXEC findBorrowerWithNoLoans

-- Procedure 4

CREATE PROC getBorrowerByDueDateAndBranch 
@duedate nvarchar(10) = NULL, @BranchName nvarchar(20) = NULL 
AS
SELECT
	a1.BranchName, a2.dateDue, a3.bookTitle, a4.borrowerName, a4.borrowerAddress
	FROM tbl_branch a1
	INNER JOIN tbl_bookLoans a2 ON a2.branchLoanID = a2.bookLoanID
	INNER JOIN tbl_books a3 ON  a3.bookID = a1.BranchID
	INNER JOIN tbl_borrower a4 ON a4.cardNo = a3.bookID
	WHERE dateDue = ISNULL(@dueDate, dateDue) AND BranchName = ISNULL(@BranchName, BranchName)
GO

--EXEC getBorrowerByDueDateAndBranch @dueDate = '2019-08-15', @BranchName = 'Central'

-- Procedure 5

CREATE PROC getTotalBooksLoaned
AS
SELECT 
	a1.BranchName, COUNT(*) AS 'Number of books loaned'
	FROM  tbl_branch a1
	INNER JOIN tbl_bookLoans ON branchLoanID = a1.BranchID
	GROUP BY BranchName 
GO
	
--EXEC getTotalBooksLoaned

-- Procedure 6

CREATE PROC findBorrowerWithMoreThan5Loans
AS
SELECT  
	a1.borrowerName, a1.borrowerAddress, COUNT(a2.branchLoanID) AS 'Number of books checked out'
	FROM tbl_borrower a1 
	INNER JOIN tbl_bookLoans a2 ON a2.cardNo = a1.cardNo
	GROUP BY borrowerName, borrowerAddress
	HAVING COUNT(a2.branchLoanID) > 5
GO

--EXEC findBorrowerWithMoreThan5Loans

-- Procedure 7

CREATE PROC getAuthorTitlesAndNumCopiesByBranch @authorName nvarchar(20) = NULL, @BranchName nvarchar(20) = NULL
AS
SELECT
	a1.authorName, a2.bookTitle, a3.numberOfCopies, a4.BranchName
	FROM tbl_authors a1
	INNER JOIN tbl_books a2 ON a2.bookID = a1.bookID
	INNER JOIN tbl_bookCopies a3 ON a3.bookCopyID = a1.bookID
	INNER JOIN tbl_branch a4 ON a4.BranchID= a3.branchID
	WHERE authorName = ISNULL(@authorName, authorName) AND BranchName = ISNULL(@BranchName, BranchName)
GO

--EXEC getAuthorTitlesAndNumCopiesByBranch @authorname = 'Stephen King', @BranchName = 'Central'






SELECT * FROM tbl_borrower
SELECT * FROM tbl_bookLoans
SELECT * FROM tbl_branch
SELECT * FROM tbl_authors
SELECT * FROM tbl_books
SELECT * FROM  tbl_bookCopies


	
	







