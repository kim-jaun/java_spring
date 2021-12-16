create table owner (
	ownerName varchar(20) primary key
);
create table pet ( 
	petId number(10) primary key,
	petName varchar2(20),
	ownerName varchar2(20) references owner(ownerName),
	price number(10), birthDate date 
);
insert into owner values ('aa');
insert into owner values('kk');
insert into owner values('부산동생');
insert into pet values(1, 'tom' , 'aa' , 10000 , sysdate);
insert into pet values(2, 'jerry' , 'kk' , 10000 , sysdate);
insert into pet values(3, 'mary' , 'kk' , 10000 , sysdate);

create table Person (
	id varchar2(20) primary key,
	email varchar2(50),
	password varchar2(20),
	name varchar2(20),
	reg_date date
);