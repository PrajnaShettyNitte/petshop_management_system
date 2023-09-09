create database petshoppro
use petshoppro

 
create table CUSTOMER(cus_id integer primary key,cus_name varchar(30),email varchar(50),address varchar(40),phone_no integer, pincode integer )
insert into CUSTOMER values(0100,'Arjun','arjun123@gmail.com','Kundapura',812345900,581343)
insert into CUSTOMER values(0101,'Bani','bani012@gmail.com','Udupi',812345670,581356)
insert into CUSTOMER values(0102,'Carol','caroljoseph@gmail.com','Manglore',787865742,581346)
insert into CUSTOMER values(0103,'Dhruv','dhruvBhat069@gmail.com','Manipal',646315678,581343)
insert into CUSTOMER values(0104,'Einston','einstonalbert@gmail.com','Manglore',997788664,581350)
insert into CUSTOMER values(0105,'Fathima','fathimakhan99@gmail.com','Karkala',991230001,574110)
insert into CUSTOMER values(0106,'Karna','karnasurya@gmail.com','Bhatkal',636134578,574110)

SELECT *
FROM CUSTOMER

create table PETDETAILS(pet_id integer primary key, pet_breed varchar(50),pet_name varchar(50),pet_weight_in_kg float,pet_food varchar(30),Gender varchar(1),Rate integer)
insert into PETDETAILS values(640,'German Shepherd','Tiger',2.0,'Adult Chicken','M',78000)
insert into PETDETAILS values(500,'British Shorthair','Chubby',1.3,'Biscuits','F',7000)
insert into PETDETAILS values(620,'Pug','Hutch',0.35,'Adult Chicken & Rice','M',2000)
insert into PETDETAILS values(507,'Sphynx cat','Symphy',0.45,'Neutered pack','M',7000)
insert into PETDETAILS values(600,'Pomeranian','Baby',2.3,'Henlo','F',23000)
insert into PETDETAILS values(606,'Golden Retriever','Charlie',2.4,'Raw chicken','F',60000)
insert into PETDETAILS values(550,'Maine coon','Coonie',1.3,'Raw chicken','F',60000)
insert into PETDETAILS values(501,'Ragdoll','Raggy',1.45,'Fish','M',60000)
insert into PETDETAILS values(502,'Ragdoll','Baccha',2.0,'Fish','F',60000)
insert into PETDETAILS values(503,'Ragdoll','Ruby',1.6,'Fish','M',60000)
insert into PETDETAILS values(601,'Pomeranian','Scooby',2.8,'Henlo','M',23000)
insert into PETDETAILS values(602,'Pomeranian','Dolly',2.56,'Raw Chicken','F',23000)

select *
From PETDETAILS



create table ORDERNEW(pet_id integer, cus_id integer,cart_id varchar(50),constraint pk10 primary key(pet_id,cus_id,cart_id), qty integer, order_date date, amount integer, constraint fk3 foreign key (pet_id) references PETDETAILS(pet_id), constraint fk4 foreign key(cus_id) references CUSTOMER(cus_id),constraint fk7 foreign key(cart_id) references CART(cart_id))
insert into ORDERNEW VALUES(500,0100,'cart101',2,'2022-10-10',14000)
insert into ORDERNEW VALUES(600,0106,'cart102',1,'2022-10-10',8000)
insert into ORDERNEW VALUES(507,0102,'cart103',1,'2022-11-14',7000)
insert into ORDERNEW VALUES(501,0104,'cart104',3,'2021-12-29',23000)
insert into ORDERNEW VALUES(550,0100,'cart105',1,'2021-11-14',7000)
insert into ORDERNEW VALUES(640,0100,'cart106',1,'2021-11-14',78000)
insert into ORDERNEW VALUES(600,0100,'cart105',1,'2021-11-14',78000)
select * from ORDERNEW 


create table CART(cart_id varchar(50) primary key,pet_id integer,cus_id integer, constraint fk5 foreign key (pet_id) references PETDETAILS(pet_id), constraint fk6 foreign key(cus_id) references CUSTOMER(cus_id), quantity integer )
insert into CART values('cart101',500,0101,1)
insert into CART values('cart102',640,0100,1)
insert into CART values('cart103',507,0102,1)
insert into CART values('cart104',600,0106,1)
insert into CART values('cart105',500,0105,2)
insert into CART values('cart106',620,0106,3)

SELECT *
FROM CART



create table CATEGORY(cat_id VARCHAR(5),pet_id int,constraint pk2 primary key(cat_id,pet_id), cat_name varchar(20),constraint fk8 foreign key(pet_id) references PETDETAILS(pet_id))
insert into CATEGORY values('D600',600,'DOGS')
insert into CATEGORY values('D600',606,'DOGS')
insert into CATEGORY values('D600',620,'DOGS')
insert into CATEGORY values('D600',640,'DOGS')
insert into CATEGORY values('C500',500,'CATS')
insert into CATEGORY values('C500',501,'CATS')
insert into CATEGORY values('C500',507,'CATS')
insert into CATEGORY values('C500',550,'CATS')


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




/*List the average weight of breeds having two or more pets*/
select pet_breed,AVG(pet_weight_in_kg) as avg_breed_weight
from PETDETAILS
GROUP BY pet_breed
having COUNT(*)>1


/*retrieve customer name,email and phone number purchasing the pet named King*/
select cus_name,email,phone_no
from CUSTOMER C, PETDETAILS P,ORDERNEW O
where C.cus_id=O.cus_id and P.pet_id=O.pet_id and P.pet_name='Tiger'


/*Retreieve the customer details of owners who purchased only cats with its name*/
select cus_name,email,pincode,pet_name
from CUSTOMER C,ORDERNEW O,PETDETAILS P
where C.cus_id=O.cus_id and O.pet_id=P.pet_id and  O.pet_id IN (select pet_id
                                         from CATEGORY C
										 where cat_name='CATS')


/*retrieve the pet details having max rate of pets in the database*/
select pet_id
from CATEGORY 
where pet_id IN (select pet_id
                 from PETDETAILS
				 where Rate IN (select max(Rate)
				                from PETDETAILS))



				 
/*Get the id and name of the pet given pet breed*/
create procedure getpet1
AS
select pet_id,pet_name
from PETDETAILS
where pet_breed='Ragdoll'
GO

exec getpet1


/*Triggers*/
create table pet_quantity(Rate int,quantity int)
insert into pet_quantity values(60000,1)
alter table pet_quantity add pet_id int

select * FROM pet_quantity
update pet_quantity
set pet_id=592 where Rate=60000

create trigger getpet9
on PETDETAILS 
after insert
as
declare @var varchar(30)
select @var=i.Rate from inserted i
update pet_quantity 
set quantity=quantity+1
where Rate=@var
GO

select * from PETDETAILS


insert into PETDETAILS values(613,'Hutch','Juzu',2.2,'fish','F',60000)
insert into PETDETAILS values(614,'Ponnu','Juzu',2.2,'fish','F',60000)
insert into PETDETAILS values(615,'Ponnu','Juzu',2.2,'fish','F',60000)
insert into PETDETAILS values(685,'Ponnu','Juzu',2.2,'fish','F',60000)




select * from pet_quantity






