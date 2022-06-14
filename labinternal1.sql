create database customersale;
use customersale;
create table customer(cust_id int primary key,cust_name varchar(20));
create table item(item_id int primary key,item_name varchar(20),price int);
create table sale(bill_no int primary key,bill_date date,cust_id int,item_id int,quantity_sold int , foreign key(cust_id)references
customer(cust_id)on delete cascade, foreign key(item_id)references item(item_id) on delete cascade);

insert into customer values(1,"anil");
insert into customer values(2,"anila");
insert into customer values(3,"bincy");
insert into customer values(4,"nikhila");
insert into customer values(5,"sanal");
insert into customer values(6,"vyshnav");

select * from customer;

insert into item values(201,"scale",10);
insert into item values(202,"pencil",7);
insert into item values(203,"scale",12);
insert into item values(204,"bag",500);
insert into item values(205,"pen",10);
insert into item values(206,"bottle",40);

select * from item;

insert into sale values(388,'2022-02-11',1,201,5);
insert into sale values(323,'2022-04-20',2,202,10);
insert into sale values(317,'2022-05-22',3,203,55);
insert into sale values(385,'2022-05-20',4,204,25);
insert into sale values(389,'2022-07-25',5,205,57);
insert into sale values(336,'2022-06-14',5,206,58);

select * from sale;

select item_id,cust_name bill_date from customer natural join sale natural join item where customer.cust_id = sale.cust_id and item.item_id=sale.item_id and bill_date='2022-06-14';

select cust_id,item_name,price from customer natural join sale natural join item where customer.cust_id=sale.cust_id and item.item_id=sale.item_id and price>200;

select cust_name,count(item_id) from customer natural join sale natural join item where customer.cust_id=sale.cust_id and item.item_id=sale.item_id group by cust_name having count(item_id>1);

select cust_id,cust_name,item_name from customer natural join sale natural join item where customer.cust_id=sale.cust_id and item.item_id=sale.item_id and cust_id;

select cust_id,cust_name,sum(quantity_sold)as total_quantity,sum(price)as total_price,sum(quantity_sold)*sum(price) as bill from customer natural join item where customer.cust_id=sale.cust_id and item.item_id=sale.item_id group by cust_id;

