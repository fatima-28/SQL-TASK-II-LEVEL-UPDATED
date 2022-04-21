CREATE DATABASE MYDATABASE
USE MYDATABASE




create table Vezife(

id int primary key ,
name varchar(50)

);
insert into Vezife values(1,'Kassir');
insert into Vezife values(2,'Satici');
insert into Vezife values(3,'Mudur');

create table Ishci(

id int primary key ,
SAA varchar(50),
vezifeId int references Vezife(id),
Maash int

);

insert into Ishci values(1,'FATIME',1,500);
insert into Ishci values(2,'Emilya',2,600);


create table Filial(

id int primary key ,
NAME varchar(50)

);

insert into Filial values(1,'Xirdalan');
insert into Filial values(2,'Nerimanov');
insert into Filial values(3,'Yasamal');

create table Mehsul(

id int primary key ,
name varchar(50),
buyprice int,
sellprice int

);

create table Satish(

id int primary key ,
MehsulID int references Mehsul(Id),
IshciID int references Ishci(Id),
FilialID int references Filial(Id),
Selldate datetime

);

insert into Satish values(1,1,2,1,2022/02/18);
insert into Satish values(2,2,2,1,2022/04/20);
insert into Satish values(3,2,1,2,2022/04/20);

-- 4) Hər işçinin satdığı məhsul sayını tap

select ISHCI.SAA AS 'ISHCI', count(MEHSUL.NAME) AS 'MEHSUL' FROM SATISH;
INNER JOIN MEHSUL
ON
MEHSUL.ID=SATISH.MehsulID
INNER JOIN ISHCI
ON
ISHCI.ID=SATISH.IshciID
GROUP BY ISHCI.SAA
--  5) Bu gün üzrə ən çox məhsul satılan filialı tap.
SELECT FILIAL.NAME AS 'FILIAL' FROM SATISH
INNER JOIN FILIAL
ON 
SATISH.FilialID=FILIAL.ID
INNER JOIN MEHSUL 
ON
MEHSUL.ID=SATISH.MehsulID
WHERE SATISH.Selldate = Getdate() AND MAX(COUNT(SATISH.ID))
 -- 6) Cari ayda ən çox satılan məhsulu tap.
 
 SELECT MAX(COUNT(NAME)) FROM MEHSUL
 INNER JOIN SATISH
 ON
 SATISH.MehsulID=MEHSUL.ID
WHERE MONTH(SATISH.Selldate) = MONTH(getdate()) 