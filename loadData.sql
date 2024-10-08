SET SCHEMA FN24_45750;
/*Author's publishers*/
/*==========================================================================================================*/
INSERT INTO Publishers(Name) VALUES ('AzimovPublisher');
INSERT INTO Publishers(Name) VALUES ('StanisławPublisher');
INSERT INTO Publishers(Name) VALUES ('ArthurPublisher');
INSERT INTO Publishers(Name) VALUES ('DouglasPublisher');
INSERT INTO Publishers(Name) VALUES ('RogerPublisher');
INSERT INTO Publishers(Name) VALUES ('RobertPublisher');
INSERT INTO Publishers(Name) VALUES ('JoanPublisher');
-- INSERT INTO Publishers(Name) VALUES ('RogerPublisher');
/*==========================================================================================================*/

/*Authors*/
/*==========================================================================================================*/
INSERT INTO Authors(Alias, FirstName, SecondName, AuthorsHouseRegistrationNumber)
SELECT 'Joan Vinge', 'Joan', 'Vinge', a.RegistrationNumber
FROM Publishers a
where a.Name = 'JoanPublisher';

INSERT INTO Authors(Alias, FirstName, SecondName, AuthorsHouseRegistrationNumber)
SELECT 'Robert Heinlein', 'Robert', 'Heinlein', a.RegistrationNumber
FROM Publishers a
where a.Name = 'RobertPublisher';

INSERT INTO Authors(Alias, FirstName, SecondName, Birthdate, YearOfFirstPublishedBook, YearOfLastPublishedBook, AuthorsHouseRegistrationNumber)
SELECT 'Isaac Asimov', 'Isaac', 'Asimov', 1920, 1950, 1993, a.RegistrationNumber
FROM Publishers a
where a.Name = 'AzimovPublisher';

INSERT INTO Authors(Alias, FirstName, SecondName, Birthdate, YearOfFirstPublishedBook, YearOfLastPublishedBook, AuthorsHouseRegistrationNumber)
SELECT 'Stanisław Lem', 'Stanisław', 'Lem', 1921, 1951, 2005, a.RegistrationNumber
FROM Publishers a
where a.Name = 'StanisławPublisher';

INSERT INTO Authors(Alias, FirstName, SecondName, Birthdate, YearOfFirstPublishedBook, YearOfLastPublishedBook, AuthorsHouseRegistrationNumber)
SELECT 'Arthur Clarke', 'Arthur', 'Clarke', 1917, 1948, 2001, a.RegistrationNumber
FROM Publishers a
where a.Name = 'ArthurPublisher';

INSERT INTO Authors(Alias, FirstName, SecondName, Birthdate, YearOfFirstPublishedBook, YearOfLastPublishedBook, AuthorsHouseRegistrationNumber)
SELECT 'Douglas Adams', 'Douglas', 'Adams', 1952, 1979, 2002, a.RegistrationNumber
FROM Publishers a
where a.Name = 'DouglasPublisher';

INSERT INTO Authors(Alias, FirstName, SecondName, Birthdate, YearOfFirstPublishedBook, YearOfLastPublishedBook, AuthorsHouseRegistrationNumber)
SELECT 'Roger Zelazny', 'Roger', 'Zelazny', 1937, 1950, 1993, a.RegistrationNumber
FROM Publishers a
where a.Name = 'RogerPublisher';
/*==========================================================================================================*/

/*Books*/
/*==========================================================================================================*/

INSERT INTO Books(Name, YearOfPublication, AuthorsHouseRegistrationNumber)
SELECT 'The Snow Queen', 1980, a.AuthorsHouseRegistrationNumber
FROM Authors a
where a.Alias = 'Joan Vinge';

INSERT INTO Books(Name, YearOfPublication, AuthorsHouseRegistrationNumber)
SELECT 'The Number of the Beast', 1980, a.AuthorsHouseRegistrationNumber
FROM Authors a
where a.Alias = 'Robert Heinlein';

/*Isaac Asimov*/
INSERT INTO Books(Name, YearOfPublication, AuthorsHouseRegistrationNumber)
SELECT 'The Gods Themselves', 1972, a.AuthorsHouseRegistrationNumber
FROM Authors a
where a.Alias = 'Isaac Asimov';

INSERT INTO Books(Name, YearOfPublication, AuthorsHouseRegistrationNumber)
SELECT 'The Naked Sun', 1957, a.AuthorsHouseRegistrationNumber
FROM Authors a
where a.Alias = 'Isaac Asimov';

INSERT INTO Books(Name, YearOfPublication, AuthorsHouseRegistrationNumber)
SELECT 'I, Robot', 1950, a.AuthorsHouseRegistrationNumber
FROM Authors a
where a.Alias = 'Isaac Asimov';



/*Stanisław Lem*/

INSERT INTO Books(Name, YearOfPublication, AuthorsHouseRegistrationNumber)
SELECT 'Eden', 1958, a.AuthorsHouseRegistrationNumber
FROM Authors a
where a.Alias = 'Stanisław Lem';

/*Arthur C. Clarke*/
INSERT INTO Books(Name, YearOfPublication, AuthorsHouseRegistrationNumber)
SELECT 'The Hammer of God', 1993, a.AuthorsHouseRegistrationNumber
FROM Authors a
where a.Alias = 'Arthur Clarke';

/*Douglas Adams*/
INSERT INTO Books(Name, YearOfPublication, AuthorsHouseRegistrationNumber)
SELECT 'The Restaurant at the End of the Universe', 1980, a.AuthorsHouseRegistrationNumber
FROM Authors a
where a.Alias = 'Douglas Adams';

/*Roger Zelazny*/
INSERT INTO Books(Name, YearOfPublication, AuthorsHouseRegistrationNumber)
SELECT 'Unicorn Variations', 1983, a.AuthorsHouseRegistrationNumber
FROM Authors a
where a.Alias = 'Roger Zelazny';
INSERT INTO Books(Name, YearOfPublication, AuthorsHouseRegistrationNumber)
SELECT 'Lord of Light', 1967, a.AuthorsHouseRegistrationNumber
FROM Authors a
where a.Alias = 'Roger Zelazny';
/*==========================================================================================================*/


/*Wrote*/
/*==========================================================================================================*/
INSERT INTO Wrote(BookId, AuthorsAlias)
SELECT b.Id, 'Isaac Asimov'
FROM Books b
WHERE b.Name IN ('The Gods Themselves', 'The Naked Sun', 'I, Robot');

INSERT INTO Wrote(BookId, AuthorsAlias)
SELECT b.Id, 'Stanisław Lem'
FROM Books b
WHERE b.Name IN ('The Hammer of God');

INSERT INTO Wrote(BookId, AuthorsAlias)
SELECT b.Id, 'Arthur Clarke'
FROM Books b
WHERE b.Name IN ('Eden');

INSERT INTO Wrote(BookId, AuthorsAlias)
SELECT b.Id, 'Douglas Adams'
FROM Books b
WHERE b.Name IN ('The Restaurant at the End of the Universe');

INSERT INTO Wrote(BookId, AuthorsAlias)
SELECT b.Id, 'Roger Zelazny'
FROM Books b
WHERE b.Name IN ('Unicorn Variations', 'Lord of Light');
/*==========================================================================================================*/

/*Genre*/
/*==========================================================================================================*/
INSERT INTO Genre(Name) VALUES ('Science Fiction');
INSERT INTO Genre(Name) VALUES ('Comedy');
INSERT INTO Genre(Name) VALUES ('Fantasy');
INSERT INTO Genre(Name) VALUES ('Horror');
INSERT INTO Genre(Name) VALUES ('Mystery');

/*==========================================================================================================*/

/*FallsIn*/
/*==========================================================================================================*/
INSERT INTO FallsIn(AuthorAlias, GenreName) VALUES ('Isaac Asimov', 'Science Fiction');
INSERT INTO FallsIn(AuthorAlias, GenreName) VALUES ('Isaac Asimov', 'Mystery');
INSERT INTO FallsIn(AuthorAlias, GenreName) VALUES ('Stanisław Lem', 'Science Fiction');
INSERT INTO FallsIn(AuthorAlias, GenreName) VALUES ('Arthur Clarke', 'Science Fiction');
INSERT INTO FallsIn(AuthorAlias, GenreName) VALUES ('Douglas Adams', 'Science Fiction');
INSERT INTO FallsIn(AuthorAlias, GenreName) VALUES ('Douglas Adams', 'Comedy');
INSERT INTO FallsIn(AuthorAlias, GenreName) VALUES ('Roger Zelazny', 'Science Fiction');
INSERT INTO FallsIn(AuthorAlias, GenreName) VALUES ('Roger Zelazny', 'Fantasy');
/*==========================================================================================================*/


/*HasGenre*/
/*==========================================================================================================*/
INSERT INTO HasGenre(BookId, GenreName)
SELECT b.Id, 'Science Fiction'
FROM Books b
WHERE b.Name IN ('The Gods Themselves', 'The Naked Sun', 'I, Robot', 'Eden', 'The Hammer of God',
                 'The Restaurant at the End of the Universe', 'Unicorn Variations', 'Lord of Light');

INSERT INTO HasGenre(BookId, GenreName)
SELECT b.Id, 'Fantasy'
FROM Books b
WHERE b.Name IN ('Unicorn Variations', 'Lord of Light');

INSERT INTO HasGenre(BookId, GenreName)
SELECT b.Id, 'Mystery'
FROM Books b
WHERE b.Name IN ('The Naked Sun');

INSERT INTO HasGenre(BookId, GenreName)
SELECT b.Id, 'Comedy'
FROM Books b
WHERE b.Name IN ('The Restaurant at the End of the Universe');
/*==========================================================================================================*/