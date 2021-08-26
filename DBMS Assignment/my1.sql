create database test;

create table IF NOT EXISTS SalesPeople(Snum INT NOT NULL,
    -> Sname VARCHAR(20) NOT NULL,
    -> City VARCHAR(20) NOT NULL,
    -> Comm INT NOT NULL,
    -> PRIMARY KEY(Snum),
    -> UNIQUE KEY(Sname)
);

INSERT INTO SalesPeople VALUES
    -> (1001, 'Peel', 'London', 12),
    -> (1002, 'Serres', 'Sanjose', 13),
    -> (1004, 'Motika', 'London', 11),
    -> (1007, 'Rifkin', 'Barcelona', 15),
    -> (1003, 'Axelrod', 'Newyork', 10);
   
create table IF NOT EXISTS Customer(
    -> Cnum int NOT NULL,
    -> Cname varchar(30) NOT NULL,
    -> City varchar(30) NOT NULL,
    -> Snum int NOT NULL,
    -> primary key(Cnum),
    -> foreign key(Snum) references SalesPeople(Snum) on delete cascade
    -> );

insert into Customer values
    -> (2001, 'Hoffman', 'London', 1001),
    -> (2002, 'Giovanni', 'Rome', 1003),
    -> (2003, 'Liu', 'Sanjose', 1002),
    -> (2004, 'Grass', 'Berlin', 1002),
    -> (2006, 'Clemens', 'London', 1001),
    -> (2008, 'Cisneros', 'Sanjose', 1007),
    -> (2007, 'Pereira', 'Rome', 1004);

create table if not exists Orders(
    -> Onum int,
    -> Amt float(10),
    -> Odate date,
    -> Cnum int,
    -> Snum int,
    -> foreign key(Cnum) references Customer(Cnum),
    -> foreign key(Snum) references SalesPeople(Snum) on delete cascade)
    -> ;

insert into Orders values 
    -> 3001, 18.69, '1990-10-3', 2008, 1007),
    -> (3003, 767.19, '1990-10-3', 2001, 1001),
    -> (3002, 1900.10, '1990-10-3', 2007, 1004),
    -> (3005, 5160.45, '1990-10-3', 2003, 1002),
    -> (3006, 1098.16, '1990-10-3', 2008, 1007),
    -> (3009, 1713.23, '1990-10-4', 2002, 1003),
    -> (3007, 75.75, '1990-10-4', 2004, 1002),
    -> (3008, 4273.00, '1990-10-5', 2006, 1001),
    -> (3010, 1309.95, '1990-10-6', 2004, 1002),
    -> (3011, 9891.88, '1990-10-6', 2006, 1001);

1). select count(Sname) from SalesPeople where Sname like 'a%' or 'A%';
2). select SalesPeople.Sname, Orders.Amt from SalesPeople inner join Orders on SalesPeople.Snum=Orders.Snum where Orders.Amt>2000;
3). select count(Sname) from SalesPeople where City='Newyork';
4). select count(Sname) from SalesPeople where City='London' or City='Paris';
5). select SalesPeople.Sname, COUNT(Orders.Snum) from SalesPeople join Orders on (Orders.Snum=SalesPeople.Snum) group by SalesPeople.Sname;


