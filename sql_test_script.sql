
SQL> CREATE TABLE Authors (
  2      AuthorID NUMBER PRIMARY KEY,
  3      Name VARCHAR2(100) NOT NULL
  4  );

Table created.

SQL> CREATE TABLE Borrowers (
  2      BorrowerID NUMBER PRIMARY KEY,
  3      Name VARCHAR2(100) NOT NULL
  4  );

Table created.

SQL> CREATE TABLE Books (
  2      BookID NUMBER PRIMARY KEY,
  3      Title VARCHAR2(255) NOT NULL
  4  );

Table created.

SQL> CREATE TABLE BookAuthors (
  2      BookID NUMBER,
  3      AuthorID NUMBER,
  4      PRIMARY KEY (BookID, AuthorID),
  5      FOREIGN KEY (BookID) REFERENCES Books(BookID),
  6      FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
  7  );

Table created.

SQL> INSERT INTO Authors (AuthorID, Name) VALUES (1, 'J.K. Rowling');

1 row created.

SQL> INSERT INTO Authors (AuthorID, Name) VALUES (2, 'J.R.R. Tolkien');

1 row created.

SQL> INSERT INTO Borrowers (BorrowerID, Name) VALUES (1, 'Alice');

1 row created.

SQL> INSERT INTO Borrowers (BorrowerID, Name) VALUES (2, 'Bob');

1 row created.

SQL> INSERT INTO Books (BookID, Title) VALUES (1, 'Harry Potter and the Sorcerer\'s Stone');
ERROR:
ORA-01756: quoted string not properly terminated


SQL> INSERT INTO Books (BookID, Title) VALUES (1, 'Harry Potter and the Sorcerer''s Stone');

1 row created.

SQL> INSERT INTO Books (BookID, Title) VALUES (2, 'The Hobbit');

1 row created.

SQL> INSERT INTO BookAuthors (BookID, AuthorID) VALUES (1, 1);

1 row created.

SQL> INSERT INTO BookAuthors (BookID, AuthorID) VALUES (2, 2);

1 row created.

SQL> INSERT INTO BookAuthors (BookID, AuthorID) VALUES (1, 2);

1 row created.

SQL> UPDATE Borrowers SET Name = 'Alice Smith' WHERE BorrowerID = 1;

1 row updated.

SQL> UPDATE Books SET Title = 'Harry Potter and the Philosopher\'s Stone' WHERE BookID = 1;
ERROR:
ORA-01756: quoted string not properly terminated


SQL> UPDATE Books SET Title = 'Harry Potter and the Philosopher''s Stone' WHERE BookID = 1;

1 row updated.

SQL> DELETE FROM Authors WHERE AuthorID = 2;
DELETE FROM Authors WHERE AuthorID = 2
*
ERROR at line 1:
ORA-02292: integrity constraint (SYSTEM.SYS_C008333) violated - child record
found


SQL> DELETE FROM Authors WHERE AuthorID = 2;
DELETE FROM Authors WHERE AuthorID = 2
*
ERROR at line 1:
ORA-02292: integrity constraint (SYSTEM.SYS_C008333) violated - child record
found


SQL> SELECT * FROM BookAuthors WHERE AuthorID = 2;

    BOOKID   AUTHORID
---------- ----------
         2          2
         1          2

SQL> DELETE FROM BookAuthors WHERE AuthorID = 2;

2 rows deleted.

SQL> DELETE FROM Authors WHERE AuthorID = 2;

1 row deleted.

SQL> SELECT b.Title, a.Name
  2  FROM Books b
  3  JOIN BookAuthors ba ON b.BookID = ba.BookID
  4  JOIN Authors a ON ba.AuthorID = a.AuthorID;

TITLE
--------------------------------------------------------------------------------
NAME
--------------------------------------------------------------------------------
Harry Potter and the Philosopher's Stone
J.K. Rowling


SQL> SELECT b.Title
  2  FROM Books b
  3  JOIN Borrowers br ON br.BorrowerID = 1;

TITLE
--------------------------------------------------------------------------------
Harry Potter and the Philosopher's Stone
The Hobbit

SQL>

