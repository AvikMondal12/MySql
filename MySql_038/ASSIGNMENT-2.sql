CREATE DATABASE avik1;
USE avik1;

-- Supplier table
CREATE TABLE SUPPLIER (
    SID VARCHAR(10) PRIMARY KEY,
    SNAME VARCHAR(50),
    CITY CHAR(20)
);

-- Item table
CREATE TABLE ITEM (
    ITEMID VARCHAR(10) PRIMARY KEY,
    INAME CHAR(50),
    ICOLOR CHAR(20)
);

-- Supply table (relationship between supplier & item)
CREATE TABLE SUPPLY (
    SID VARCHAR(10),
    ITEM_ID VARCHAR(10),
    QUANTITY INT,
    PRIMARY KEY (SID, ITEM_ID),
    FOREIGN KEY (SID) REFERENCES SUPPLIER(SID),
    FOREIGN KEY (ITEM_ID) REFERENCES ITEM(ITEMID)
);


INSERT INTO SUPPLIER (SID, SNAME, CITY)
VALUES 
('S001', 'Manish', 'Kolkata'),
('S002', 'Hari', 'Delhi'),
('S003', 'Kundan', 'Kolkata'),
('S004', 'Sagar', 'Pathna'),
('S005', 'Zahir', 'Delhi');
SELECT * FROM SUPPLIER 

ALTER TABLE ITEM
ADD WEIGHT INT;


ALTER TABLE ITEM
MODIFY WEIGHT VARCHAR(10);

INSERT INTO ITEM (ITEMID,INAME,ICOLOR,WEIGHT)
VALUES
('ITEM 1', 'Desk', 'Brown','20kg'),
('ITEM 2', 'Chair', 'Red','7kg'),
('ITEM 3', 'Board-i', 'Blue','15kg'),
('ITEM 4', 'Board-ii', 'White','10kg'),
('ITEM 5', 'Marker', 'Black','20gm');
SELECT * FROM ITEM

INSERT INTO supply (SID,ITEM_ID,QUANTITY)
VALUES
('S002', 'ITEM 2',210),
('S001', 'ITEM 5', 200),
('S005', 'ITEM 1', 125),
('S002', 'ITEM 5', 500),
('S005', 'ITEM 2', 156),
('S001', 'ITEM 1', 370);

/*Display all the tables*/
SELECT * FROM SUPPLIER ;
SELECT * FROM ITEM;

/*Find all the existing suppliers*/
SELECT * FROM SUPPLY;

/*Find all the items which are sold by at least one sopplier*/

SELECT *
FROM ITEM
WHERE ITEM_ID IN (SELECT ITEM_ID FROM SUPPLY);

/*Find all the suppliers who livein Delhi*/
SELECT * FROM SUPPLIER WHERE CITY = 'Delhi';

/*Find all the supplier who do not live in Kolkata*/
SELECT * FROM SUPPLIER WHERE CITY!='Kolkata';

/*Find all the supplier who do not sell any items */
SELECT * 
FROM SUPPLIER
WHERE SID NOT IN (SELECT SID FROM SUPPLY);

/*find all the suppliers who sell at least one item*/
SELECT
    SID,
    SNAME
FROM
    SUPPLIER
WHERE
    SID IN (SELECT DISTINCT SID FROM SUPPLY);
    
    
    
/*Find all the suppliers who sell the item number 'ITEM 1*/

SELECT SID, SNAME
FROM SUPPLIER
WHERE SID IN (
    SELECT SID
    FROM SUPPLY
    WHERE ITEM_ID = 'ITEM 1'
);



/*
Q8.  FIND ALL THE SUPPLIERS WHO SELL EITHER ITEM NUMBER 'ITEM 1' OR 'ITEM 2'
*/
SELECT SID, SNAME
FROM SUPPLIER
WHERE SID IN (
    SELECT SID
    FROM SUPPLY
    WHERE ITEM_ID IN ('ITEM 1','ITEM 2')
);


/*Q9. fIND ALL THE SUPPLIERS WHO SELL THE ITEM OF COLOR RED
*/
SELECT SID, SNAME
FROM SUPPLIER
WHERE SID IN (
	SELECT SID
    FROM SUPPLY 
    WHERE ITEM_ID IN(
			SELECT ITEM_ID
            FROM ITEM
            WHERE COLOR = 'Red')
            );
            
            
            
/*        
Q10. FIND ALL THE SUPLIERS WHO SELL THE ITEM OF COLOR RED WITH QUANTITY BETWEEN 200 AND 500
*/
SELECT SID, SNAME
FROM SUPPLIER
WHERE SID IN (
	SELECT SID
    FROM SUPPLY 
    WHERE QUANTITY BETWEEN 200, 500 AND ITEM_ID IN(
			SELECT ITEM_ID
            FROM ITEM
            WHERE COLOR = 'Red')
	);