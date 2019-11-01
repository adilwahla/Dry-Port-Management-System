 /** Customer_Table Creation **/
create table admin_t
(
admin_CNIC int ,
admin_name varchar(20),
Phone_no int,
CONSTRAINT admin_pk1 Primary key (admin_CNIC)
);

/** General Insertion Query **/
/**
insert into admin_t (admin_CNIC,admin_name,Phone_no) values ('&admin_CNIC','&admin_name','&Phone_no');
**/
/** Specific insertion Query **/
insert into admin_t (admin_CNIC,admin_name,Phone_no) values ('12345678910111','hamza','0300000000001');
insert into admin_t (admin_CNIC,admin_name,Phone_no) values ('12345678910112','adil','0300000000002');


/**port_t table creation **/
create table port_t
(   port_id int ,
   portName varchar(20),
   vessel_id varchar(20) ,
   
CONSTRAINT port_pk1 Primary key  ( port_id)

);
/** General insertion query **/
/**
insert into  port_t(port_id, portName, vessel_id) values('&port_id', '&portName', '&vessel_id') ;
/** specific Insertion Query **/
insert into  port_t(port_id, portName, vessel_id) values('1', 'ISL1 ', 'RNP1') ;
insert into  port_t(port_id, portName, vessel_id) values('2', 'ISL2 ', 'RNP2') ;





/** vessel_t Table Creation **/
create table vessel_t
(  vessel_id  varchar(20),
   VesselName varchar(20),
   port_id int,

CONSTRAINT  vessel_pk1 Primary key  ( vessel_id),
CONSTRAINT vessel_fk1 Foreign key (  port_id) References port_t (  port_id) 
);
/** General insertion query **/
/**
insert into vessel_t(vessel_id,VesselName,port_id) values('&vessel_id','&VesselName','&port_id');
/** specific Insertion Query **/
insert into vessel_t(vessel_id,VesselName,port_id) values           ('RNP1','tpR001','1');
insert into vessel_t(vessel_id,VesselName,port_id) values           ('RNP2','tpR002','2');







/**  Emplooy_t Table Creation **/
create table Emplooy_t
(
employee_id int,
empName varchar(20),
address varchar(20),
Phone_no int,
admin_CNIC int ,
port_id int,
emppassword varchar(20);

CONSTRAINT employee_pk1 Primary key  (employee_id),
CONSTRAINT employee_fk1 Foreign key  (admin_CNIC ) References  admin_t(admin_CNIC),
CONSTRAINT employee_fk2 Foreign key  (port_id ) References port_t(port_id)
);
/** General Insertion Query **/
/**
insert into Emplooy_t(employee_id,empName,address,Phone_no,admin_CNIC,port_id) values ('&employee_id','&empName','&address','&Phone_no','&admin_CNIC','&port_id');
/** Specific insertion Query **/
insert into Emplooy_t(employee_id,empName,address,Phone_no,admin_CNIC,port_id) values ('01','paa Rafique','pind dadankhan','03000000000','12345678910111','1');
insert into Emplooy_t(employee_id,empName,address,Phone_no,admin_CNIC,port_id) values ('02',' paa shafique','pind pootni','03000000001','12345678910112','2');




/** Ticket Table Creation **/
create table Ticket_t
(
Ticket_num int ,
employee_id int ,
price int ,
Destination varchar(20),
vessel_id varchar(20) ,
transport_incharge varchar (20) ,
CONSTRAINT ticket_fk1 Foreign key  (employee_id ) References Emplooy_t(employee_id),
CONSTRAINT ticket_fk2 foreign key  (vessel_id)References vessel_t(vessel_id),

CONSTRAINT ticket_pk2 primary key (Ticket_num)
);
/** General Insertion Query **/
/**
insert into Ticket_t (Ticket_num,employee_id,price,Destination,vessel_id,transport_incharge) values ('&Ticket_num','&employee_id','&price','&Destination','&vessel_id','&transport_incharge');
**/
/** Specific insertion Query **/
insert into Ticket_t (Ticket_num,employee_id,price,Destination,vessel_id,transport_incharge) values ('1','01','3000','I Block G9','RNP1','M Samee');
insert into Ticket_t (Ticket_num,employee_id,price,Destination,vessel_id,transport_incharge) values ('2','02','4000','A Block G8','RNP2','M  Rizwan');


create table serviceCharges
(
service_id int,
tax int ,
employee_id int,
CONSTRAINT Service_pk1 Primary key  (service_id),
CONSTRAINT serviceCharges_fk1 Foreign Key (employee_id) References Emplooy_t (employee_id)
);
/** General Insertion Query **//**
insert into serviceCharges(service_id,tax,employee_id) values('&service_id','&tax','&employee_id');
/** specific Insertion Query **/
insert into serviceCharges(service_id,tax,employee_id) values('001','300','01');
insert into serviceCharges(service_id,tax,employee_id) values( '002','500','02');




/** cargo_t Table Creation **/
create table cargo_t
(
cargo_id int  ,
item_no int,
itemName varchar(20), 
weight int,
cargoSize varchar(20) ,
service_id int ,
CONSTRAINT cargo_pk1 Primary key  (cargo_id),
CONSTRAINT cargo_fk1 Foreign key  (service_id) References serviceCharges(service_id)
);
/** General Insertion Query **/
/**
insert into cargo_t(cargo_id,item_no,itemName,weight,cargoSize,service_id) values('&cargo_id','&item_no','&itemName','&weight','&cargoSize','&service_id');
/** specific Insertion Query **/
insert into cargo_t(cargo_id,item_no,itemName,weight,cargoSize,service_id) values('101','1','cotton','100','50','001');
insert into cargo_t(cargo_id,item_no,itemName,weight,cargoSize,service_id) values('102','2','wheat','200','70','002');
/** serviceCharges table Creation **/



/**transporter table creation **/
create table transporter
(
  transporter_id int,
  transporterName varchar(20),
   phoneNO number,
 address varchar(20),
 vessel_id varchar(20)  ,
CONSTRAINT transporter_pk1 Primary key  (transporter_id),
CONSTRAINT transporter_fk1 Foreign key  ( vessel_id) References vessel_t ( vessel_id)
);
/** General Insertion Query **/
/**
insert into  transporter( transporter_id,transporterName, phoneNO,address, vessel_id) values( '& transporter_id','&transporterName', '&phoneNO','&address', '&vessel_id');
/** specific Insertion Query **/
insert into  transporter(  transporter_id,transporterName, phoneNO,address, vessel_id) values( '201','shamshad', '03000000000','C BLOCK', 'RNP1');
insert into  transporter(  transporter_id,transporterName, phoneNO,address, vessel_id) values( '202','amer', '03000000001','D BLOCK', 'RNP2');

/**destination_t table creation **/
create table destination_t
(   destination_id int ,
   address varchar(20),

CONSTRAINT dest_pk1 Primary key  (destination_id)

);
/** General insertion query **/
/**
insert into destination_t(destination_id, address) values('&destination_id', '&address');
/** specific Insertion Query **/
insert into destination_t(destination_id, address) values('301', 'F BLOCK');
insert into destination_t(destination_id, address) values('302', 'A BLOCK');



/**cust_t table creation **/
create table cust_t
(   customer_id int ,
      custName varchar(20),
       custAddress varchar(20),  
   
CONSTRAINT cust_pk1 Primary key  ( customer_id)

);
/** General insertion query **/
/**
insert into  cust_t(customer_id, custName, custAddress) values( '&customer_id', '&custName', '&custAddress') ;
/** specific Insertion Query **/
insert into  cust_t(customer_id, custName, custAddress) values('1', ' wahla', 'sadiqabad') ;
insert into  cust_t(customer_id, custName, custAddress) values('2', ' salain', 'multan') ;



create table order_t
(   order_id int ,
      orderName varchar(20),
       order_date date,  
   customer_id int ,
CONSTRAINT order_fk1 Foreign key  (  customer_id) References cust_t( customer_id)

);
select * from  order_t;
/** General insertion query **/
/
insert into  order_t(order_id, orderName, order_date, customer_id) values('&order_id', '&orderName', '&order_date', '&customer_id') ;
/** specific Insertion Query **/
insert into  order_t(order_id, orderName, order_date, customer_id) values('1', 'bails of cotton', '', '1') ;
insert into  order_t(order_id, orderName, order_date, customer_id) values('2', 'bails ofwhaat', '', '2') ;

/**
drop table admin_t;
drop table port_t;
drop table vessel_t;
drop table  Emplooy_t;
drop table  Ticket_t;
drop table  serviceCharges;
drop table  cargo_t;
drop table   transporter;
drop table   destination_t;
drop table  cust_t;
drop table  order_t;
**/

----------->/** ADMIN view query **/
  CREATE or REPLACE VIEW adminVU AS 
SELECT   vessel_t.VesselName as Container_liscence, Emplooy_t.empName ,Emplooy_t.address as Employee_Address,Emplooy_t.Phone_no,Ticket_t.transport_incharge,Ticket_t.Destination,cargo_t.item_no
,serviceCharges.tax
FROM vessel_t,Emplooy_t,Ticket_t,cargo_t,serviceCharges;
 select * from adminVU;
 
----------> /** empVU view query **/
CREATE OR REPLACE VIEW empVU AS
SELECT customer_id,order_id, orderName,order_date
FROM order_t
WHERE customer_id=1;
select * from empVU;
------------>/** join   query **/
select  cargo_t.item_no,cargo_t.weight,serviceCharges.tax,serviceCharges.employee_id
from    serviceCharges
join    cargo_t
on           serviceCharges.service_id= cargo_t.service_id;
select       Emplooy_t.empName,Emplooy_t.address,Emplooy_t.admin_CNIC,Emplooy_t.port_id
from            serviceCharges
    join     Emplooy_t                     
on     serviceCharges.employee_id= Emplooy_t.employee_id; 



============================================
/** Oracle Database automatically executes a trigger when a specified event takes place,
which may be in the form of a system event or a DML statement being issued against the table.**/



/**
CREATE OR REPLACE TRIGGER trigger_order
BEFORE INSERT
   ON order_t
   FOR EACH ROW

DECLARE
   order_date date;

BEGIN

 

   -- Update create_date field to current system date
   :new.order_date := sysdate;

   

END;**/
/**
   //==============================-------------------procedures-----------===================================//
///---------------------------INSERTION PROCEDURES-----------------------------////
//---PERSON TABLE-----//
create or replace 
PROCEDURE create table Emp_t( employee_id int,empName varchar(20),address varchar(20),Phone_no int,admin_CNIC int ,port_id int)
is 
begin
insert into Emplooy_t( employee_id int,empName varchar(20),address varchar(20),Phone_no int,admin_CNIC int ,port_id int) Values ( employee_id ,empName ,address ,Phone_no ,admin_CNIC  ,port_id );
commit;
end;
begin
Emp_t(01,'paa Rafique','pind dadankhan',03000000000,12345678910111,1);
end;

