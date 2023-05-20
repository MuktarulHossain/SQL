create table Customer(
cid varchar(50) primary key,
c_name varchar(50) not null,
gender char(1) check('M','F'),
mobile_no number(11),
);
