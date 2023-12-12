use realastatemgt;

create table realastatemgt.propertytype(
id int primary key auto_increment,
type varchar(25) not null,
description varchar(250) not null
);

insert into realastatemgt.propertytype(type,description)values('apartment','having nice view');
insert into realastatemgt.propertytype(type,description)values('villa','having good look');


create table  realastatemgt.property(
id int primary key auto_increment,
propertyid int,
name varchar(20),
dimensions varchar(25),
constraint fk_property_propertytype_propertyid foreign key (propertyid) references realastatemgt.propertytype(id)
);

insert into realastatemgt.property(propertyid,name,dimensions)values(1,'hostel1','25 sqr ft');
insert into realastatemgt.property(propertyid,name,dimensions)values(2,'hostel2','50 sqr ft');

create table realastatemgt.address(
id int primary key auto_increment,
street varchar(100),
landmark varchar(100),
state varchar(100),
country varchar(25),
pincode int not null
);

insert into realastatemgt.address(street,landmark,state,country,pincode) values('abc','near ntr statue','ts','india',500000);
insert into realastatemgt.address(street,landmark,state,country,pincode) values('def','near ranga statue','ts','india',500000);

create table realastatemgt.addressmapping(
id int primary key auto_increment,
propertyid int,
addressid int,
constraint fk_addressmapping_property_propertyid foreign key(propertyid) references  realastatemgt.property(id),
constraint fk_addressmapping_address_addressid foreign key(addressid) references  realastatemgt.address(id)
);

insert into realastatemgt.addressmapping(propertyid,addressid)values(1,1);
insert into realastatemgt.addressmapping(propertyid,addressid)values(2,2);

select * from realastatemgt.propertytype;
select * from realastatemgt.property;
select * from realastatemgt.address;
select * from realastatemgt.addressmapping;

select * from realastatemgt.propertytype as pt join  realastatemgt.property as p on pt.id = p.propertyid;
select * from realastatemgt.property as p join  realastatemgt.addressmapping as am on p.id = am.propertyid;
select * from realastatemgt.address as ad join  realastatemgt.addressmapping as am on ad.id = am.addressid;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_propertydetails`()
BEGIN
select * from realastatemgt.propertytype as pt 
join  realastatemgt.property as p on pt.id = p.propertyid
join  realastatemgt.addressmapping as am on p.id = am.propertyid;
END$$
DELIMITER ;

call get_propertydetails;

select * from propertytype;

call save_propertytype(9,'hostel','adv');

DELIMITER $$
USE `realastatemgt`$$
CREATE PROCEDURE `update_propertytype` (propertytypeid int,propertytype varchar(25),propertydescription varchar(250))
BEGIN
update propertytype set type=propertytype,description=propertydescription where id=propertytypeid ;
END$$

DELIMITER ;

update propertytype set type='villa' where id =9;

delete from propertytype where id=9;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_property`()
BEGIN
select * from realastatemgt.propertytype as pt 
join  realastatemgt.property as p on pt.id = p.propertyid
join  realastatemgt.addressmapping as am on p.id = am.propertyid;
END$$
DELIMITER ;


call save_property(3,3,'hostel3','50 sqft');



DELIMITER $$
USE `realastatemgt`$$
CREATE PROCEDURE `update_property`(propertyid int,propertytypeid int,propertyname varchar(20),propertydimensions varchar(25))
BEGIN
update property set type=propertytypeid,name=propertyname,dimensions=propertydimensions where id=propertyid;
END$$

DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_address`()
BEGIN
select * from realastatemgt.propertytype as pt 
join  realastatemgt.property as p on pt.id = p.propertyid
join  realastatemgt.addressmapping as am on p.id = am.propertyid;
END$$
DELIMITER ;
select * from property;

call save_address(3,'ghi','near pkl','ts','india',500044);

select * from address;


DELIMITER $$
USE `realastatemgt`$$
CREATE PROCEDURE `update_address` (addid int,addstreet varchar(200),addlandmark varchar(100),addstate varchar(100),addcountry varchar(25),addpincode int)
BEGIN
update address set type=addstreet,landmark=addlandmark,state=addstate,country=addcountry,pincode=addpincode where id=addid;
END$$
2
DELIMITER ;


update address set street='ooo' where id=1;

delete from address where id=2;
