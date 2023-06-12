

UPDATE Client SET Client_name = 'Oscar', Client_surname = 'Ek', Client_telefone_number = '0723465321' WHERE Client_id = 4;
DELETE FROM Client WHERE Client_ID = 4;

UPDATE Account SET Account_close_date = '2022-12-25 20:42:13' WHERE Account_ID=102038;
UPDATE Account SET Account_close_date = '2022-12-27 10:00:00' WHERE Account_ID=201041;
UPDATE Account SET Account_close_date = '2022-12-28 16:23:10' WHERE Account_ID=503041;


SELECT * FROM Transaction_Account WHERE Account_ID_to = 201041;
SELECT SUM (Transaction_value) FROM Transaction_Account WHERE Account_ID_to = 201041;
SELECT * FROM Transaction_Account WHERE Account_ID_from = 201041;
SELECT SUM (Transaction_value) FROM Transaction_Account WHERE Account_ID_from = 201041;
SELECT MIN (Transaction_value) FROM Transaction_Account;

SELECT Transaction_value FROM Transaction_Account; 

SELECT  
t2.Bank_name, (t3.Client_surname + ' ' + t3.Client_name) as full_name, t1.Account_ID, t4.Currency_name
FROM 
Account t1
JOIN Bank t2 ON t1.Bank_ID = t2.Bank_ID
JOIN Client t3 ON t1.Client_ID = t3.Client_ID
JOIN Currency t4 ON t1.Currency_ID = t4.Currency_ID
ORDER BY t2.Bank_name, full_name;
 

SELECT * FROM Client WHERE Client_name = 'Sara' OR Client_ID = 2;
SELECT * FROM Account WHERE Account_open_date BETWEEN '2018-07-13 08:00:00' AND '2020-10-22 23:59:59';


SELECT Transaction_date, (CASE WHEN Account_ID_from = 201041 THEN -Transaction_value ELSE Transaction_Value END) AS Val, 
SUM(CASE WHEN Account_ID_from = 201041 THEN -Transaction_value ELSE Transaction_Value END) OVER (
    ORDER BY Transaction_date
    RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS balance
FROM Transaction_Account 
WHERE Account_ID_from = 201041 OR Account_ID_to = 201041;


SELECT TOP 5 * FROM Excange_rate WHERE Currency_ID_from <> 1226;

SELECT  * FROM Excange_rate WHERE Currency_ID_from <> 1226;

DECLARE @Variable1 INT = 80;
DECLARE @Variable2 INT = 500;
SELECT * FROM Excange_rate WHERE Excange_rate_value BETWEEN @Variable1 AND @Variable2;


DECLARE @Account INT = 201041;
WITH Account_Balance (Account_ID, Balance) AS (
SELECT @Account AS Account_ID, SUM (CASE WHEN Account_ID_from = @Account THEN -Transaction_value ELSE Transaction_value END) AS Balance
FROM Transaction_Account
WHERE Account_ID_from = @Account OR Account_ID_to = @Account
)
SELECT t3.Bank_name, (t4.Client_surname + ' ' + t4.Client_name) as full_name, t1.Account_ID, t5.Currency_name, t2.Balance
FROM Account t1
JOIN Account_Balance t2 ON t1.Account_ID = t2.Account_ID
JOIN Bank t3 ON t1.Bank_ID = t3.Bank_ID
JOIN Client t4 ON t1.Client_ID = t4.Client_ID
JOIN Currency t5 ON t1.Currency_ID = t5.Currency_ID;


DECLARE @Cur_Name CHAR(3) = 'USD';

SELECT t2.Currency_name, @Cur_Name AS To_Currency, AVG (t1.Excange_rate_value) AS Average_rate
FROM Excange_rate t1
JOIN Currency t2 ON t1.Currency_ID_from = t2.Currency_ID
WHERE t1.Currency_ID_to = (SELECT Currency_ID FROM Currency WHERE Currency_name = @Cur_Name)
GROUP BY t2.Currency_name;


--Join
--INSERT
--UPDATE 
--DELETE
--2 math-functions
--date
--range
--where
--sort
--top
--group by
--variabler