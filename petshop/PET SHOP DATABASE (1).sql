create database petshop
use petshop

create table CUSTOMER(cus_id integer primary key,cus_name varchar(30),email varchar(50),password1 varchar(20), phone_no integer, pincode integer )
insert into CUSTOMER values(0100,'Arjun','arjun123@gmail.com','arjun123',812345900,581343)
insert into CUSTOMER values(0101,'Bani','bani012@gmail.com','bani012',812345670,581356)
insert into CUSTOMER values(0102,'Carol','caroljoseph@gmail.com','carolj123',787865742,581346)
insert into CUSTOMER values(0103,'Dhruv','dhruvBhat069@gmail.com','dhruv069',646315678,581343)
insert into CUSTOMER values(0104,'Einston','einstonalbert@gmail.com','einstonal009',997788664,581350)
insert into CUSTOMER values(0105,'Fathima','fathimakhan99@gmail.com','fathima99',991230001,574110)
insert into CUSTOMER values(0106,'Karna','karnasurya@gmail.com','karna789',636134578,574110)

SELECT *
FROM CUSTOMER

create table PETDETAILS(pet_id integer primary key, breed varchar(50), pet_img varchar(20), pet_foods varchar(50), Rate integer,Gender varchar(1))
insert into PETDETAILS values(640,'German Shepherd','GS.jpg','Adult Chicken',78000,'M')
insert into PETDETAILS values(500,'British Shorthair','Shorthair.jpg','Biscuits',7000,'F')
insert into PETDETAILS values(620,'Pug','Pug.jpg','Adult Chicken & Rice',20000,'M')
insert into PETDETAILS values(507,'Sphynx cat','sphynx.jpg','Neutered pack',7000,'M')
insert into PETDETAILS values(600,'Pomeranian','pomeranian.jpg','Henlo',23000,'F')
insert into PETDETAILS values(606,'Golden Retriever','GoldenRetriever.jpg','Raw chicken',60000,'F')


SELECT *
FROM PETDETAILS
DROP table PETDETAILS



create table ORDERNEW(pet_id integer, cus_id integer, constraint fk2 primary key(pet_id,cus_id), qty integer, order_date date, amount integer, constraint fk3 foreign key (pet_id) references PETDETAILS, constraint fk4 foreign key(cus_id) references CUSTOMER(cus_id) )
insert into ORDERNEW VALUES(500,0100,2,'2022-10-10',14000)
insert into ORDERNEW VALUES(600,0106,1,'2022-10-10',8000)
insert into ORDERNEW VALUES(507,0102,1,'2022-11-14',7000)
insert into ORDERNEW VALUES(501,0104,3,'2021-12-29',23000)
insert into ORDERNEW VALUES(550,0100,1,'2021-11-14',7000)
insert into ORDERNEW VALUES(640,0100,1,'2021-11-14',78000)


SELECT *
FROM ORDERNEW
DROP table ORDERNEW

create table CART(cart_id integer primary key, pet_id integer, cus_id integer, constraint fk5 foreign key (pet_id) references PETDETAILS(pet_id), constraint fk6 foreign key(cus_id) references CUSTOMER(cus_id), quantity integer )
insert into CART values(998877660,500,0101,1)
insert into CART values(456789242,640,0100,1)
insert into CART values(879675540,507,0102,1)
insert into CART values(789968812,600,0106,1)
insert into CART values(998877663,500,0105,2)
insert into CART values(998844559,620,0106,3)

SELECT *
FROM CART
DROP table CART



create table CATEGORY(cat_id VARCHAR(5) primary key, cat_name varchar(20))
insert into CATEGORY values('D600','DOGS')
insert into CATEGORY values('C500','CATS')

drop TABLE CATEGORY

SELECT *
FROM CUSTOMER
SELECT *
FROM PETDETAILS
SELECT *
FROM ORDERNEW
SELECT *
FROM CART
SELECT *
FROM CATEGORY



