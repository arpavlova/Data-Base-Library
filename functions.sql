SET SCHEMA FN24_45750;


DROP FUNCTION GetBooksByYear;
CREATE FUNCTION GetBooksByYear(Year INT)
RETURNS TABLE (BOOKNAME VARCHAR(100))
    RETURN
        SELECT Name FROM Books
        WHERE Year = YEAROFPUBLICATION;

DROP FUNCTION GetBooksByAuthorAlias;
CREATE FUNCTION GetBooksByAuthorAlias(AliasInput VARCHAR(100))
RETURNS TABLE (NAME VARCHAR(100), YEAROFPUBLICATION INT)
    RETURN
        SELECT Name, YEAROFPUBLICATION FROM Books
        WHERE AUTHORSHOUSEREGISTRATIONNUMBER IN (SELECT A.AUTHORSHOUSEREGISTRATIONNUMBER from AUTHORS A where AliasInput = A.ALIAS);



SELECT * FROM TABLE(FN24_45750.GetBooksByYear(1980)) T;


SELECT * FROM TABLE(FN24_45750.GetBooksByAuthorAlias('Isaac Asimov')) T;

