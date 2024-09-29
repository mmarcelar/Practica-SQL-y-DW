CREATE OR REPLACE FUNCTION Keepcoding.clean_integer(input INT64) RETURNS INT64 AS
((SELECT IFNULL(input, -999999)));

SELECT Keepcoding.clean_integer(null);

SELECT Keepcoding.clean_integer(127000);