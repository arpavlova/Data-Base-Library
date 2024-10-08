SET SCHEMA FN24_45750;

CREATE TABLE Publishers (
  RegistrationNumber INT NOT NULL PRIMARY KEY GENERATED
  ALWAYS AS IDENTITY
(START WITH 1,INCREMENT BY 1),
  Name VARCHAR(100)
);

CREATE TABLE Books (
  Id INT NOT NULL GENERATED
ALWAYS AS IDENTITY
(START WITH 1,INCREMENT BY 1),
  Name VARCHAR(100),
  YearOfPublication INT,
  AuthorsHouseRegistrationNumber INT,
  PRIMARY KEY(Id),
  FOREIGN KEY (AuthorsHouseRegistrationNumber)
      REFERENCES Publishers(RegistrationNumber)

);

CREATE TABLE Authors (
  Alias VARCHAR(100) NOT NULL PRIMARY KEY,
  FirstName VARCHAR(100),
  SecondName VARCHAR(100),
  Birthdate INT,
  YearOfFirstPublishedBook INT,
  YearOfLastPublishedBook INT,
  AuthorsHouseRegistrationNumber INT,
   FOREIGN KEY (AuthorsHouseRegistrationNumber)
    REFERENCES Publishers(RegistrationNumber)
);

CREATE TABLE Wrote (
  BookId INT NOT NULL,
  AuthorsAlias VARCHAR(100) NOT NULL,
  PRIMARY KEY (BookId, AuthorsAlias),
   FOREIGN KEY (BookId)
    REFERENCES Books(Id),
    FOREIGN KEY (AuthorsAlias)
    REFERENCES Authors(Alias)
);

CREATE TABLE FallsIn (
  AuthorAlias VARCHAR(100) NOT NULL,
  GenreName VARCHAR(100) NOT NULL,
  PRIMARY KEY (AuthorAlias, GenreName),
       FOREIGN KEY (GenreName)
    REFERENCES Genre(Name),
    FOREIGN KEY (AuthorAlias)
    REFERENCES Authors(Alias)
);

CREATE TABLE Genre (
  Name VARCHAR(100) NOT NULL PRIMARY KEY
);


CREATE TABLE HasGenre (
  BookId INT NOT NULL,
  GenreName VARCHAR(100) NOT NULL,
  PRIMARY KEY (BookId, GenreName),
   FOREIGN KEY (BookId)
    REFERENCES Books(Id),
    FOREIGN KEY (GenreName)
    REFERENCES Genre(Name)
);
ALTER TABLE Authors ADD CONSTRAINT CK_JB_SAL CHECK (YearOfFirstPublishedBook <= YearOfLastPublishedBook);