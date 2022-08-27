--Welcome To The Address Book DataBase Problem--

--uc1 create data base--
create database AddressBook_service_DB
select name from sys.databases
use AddressBook_service_DB

--uc2 add Addressbook table--
create table AddressBook_Table
(s_no int identity(1,1),
firstname varchar(50),
lastname varchar(50),
address varchar(100),
city varchar(100),
state varchar(50),
zip int,
phno bigint,
email varchar(50)
);
select * from AddressBook_Table

-- delete table -- 
drop table AddressBook_Table

--uc3 insert contact details into table--
insert into AddressBook_Table values
('pavan','kalyan','pettugollapalli','vizag','AP',531083,9603083843,'pkkoppisetti@gmail.com'),
('mani','kanta','pettugollapalli','vizag','AP',531083,9052077630,'mani@gmail.com'),
('karishma','shaik','BZA','BZA','AP',532681,9876543215,'karishma@gmail.com'),
('vandana','sai','simhachalam','vizag','AP',536782,6890843568,'vandana@gmail.com');
select * from AddressBook_Table

--uc4 edit contact by person's name--
update AddressBook_Table set email ='manikanta@gmail.com' where firstname = 'mani'
update AddressBook_Table set address ='vijayawada' where firstname = 'karishma'
select * from AddressBook_Table

--uc5 delete existing contact using name--
delete AddressBook_Table where firstname = 'vandana'
select * from AddressBook_Table

--uc6 retrieve person belonging to city or state--
select * from AddressBook_Table where city ='vizag' or state = 'AP'
select firstname from AddressBook_Table where city ='vizag' or state = 'AP'

--uc7 size of addressbook--
select COUNT(city) from AddressBook_Table 
select COUNT(state) from AddressBook_Table 
select COUNT(*) as statecount ,state  from AddressBook_Table group by state
select COUNT(*) as citycount ,city  from AddressBook_Table group by city

--uc8 sort entries by name alphbatically--
select firstname from AddressBook_Table order by city 
select * from AddressBook_Table order by city 
select  firstname,address from  AddressBook_Table order by city,firstname 
select  * from  AddressBook_Table order by city,firstname 

--uc9 Identify each addressboook with name and type--
alter table AddressBook_Table add contacttype varchar(50) default 'friend' not null
select * from AddressBook_Table
update AddressBook_Table  set contacttype = 'family' where firstname = 'mani'
update AddressBook_Table  set contacttype = 'family' where address = 'pettugollapalli'

--uc10 get contact count by type--
select count(*) as countpersons, contacttype from AddressBook_Table  group by contacttype

--uc11 add person to both family and friend--
insert into AddressBook_Table values
('vandana','sai','simhachalam','vizag','AP',536782,6890843568,'vandana@gmail.com','friend'),
('satya','jagadish','tuni','vizag','AP',531067,7896543213,'satyajagadhish@gmail.com','friend'),
('satya','jagadish','tuni','vizag','AP',531067,7896543213,'satyajagadhish@gmail.com','family')
select * from AddressBook_Table
--update AddressBook_Table set s_no=4 where lastname='sai'
--set identity_insert AddressBook_Table on