select version();

SELECT *
FROM pg_catalog.pg_tables

drop table publicactionsraw;

CREATE TABLE publicationsraw (
WorkRef VARCHAR(255), 
VISTAPublisher VARCHAR(255) ,
PublicationDate VARCHAR(255),
WorkAlert VARCHAR(255) ,
ExcludedFromConfirmation VARCHAR(255) ,
ConfirmationRestrictionAdded VARCHAR(255) ,
ConfirmationNotes VARCHAR(255) ,
WorkStatus VARCHAR(255) ,
Imprint VARCHAR(255) ,
CommissioningEditor VARCHAR(255) ,
ISBN VARCHAR(255),
ProductType VARCHAR(255) ,
EditionTarget VARCHAR(255),
Binding VARCHAR(255) ,
Format VARCHAR(255) ,
EditionVISTAProdType VARCHAR(255),
EditionPriceSynchronisationTemplate VARCHAR(255),
EditionExtent VARCHAR(255),
EditionEmbargoedUntil VARCHAR(255)
);

drop table VISTAPublisher;
drop table WorkAlert ;
drop table WorkStatus;
drop table Imprint;
drop table CommissioningEditor;
drop table ProductType;
drop table EditionTarget;
drop table Binding;
drop table Format;


create table VISTAPublisher as select distinct VISTAPublisher from publicationsraw;
create table WorkAlert as select distinct WorkAlert from publicationsraw;
create table WorkStatus as select distinct WorkStatus from publicationsraw;
create table Imprint as select distinct Imprint from publicationsraw;
create table CommissioningEditor as select distinct CommissioningEditor from publicationsraw;
create table ProductType as select distinct ProductType from publicationsraw;
create table EditionTarget as select distinct EditionTarget from publicationsraw;
create table Binding as select distinct Binding from publicationsraw;
create table Format as select distinct Format from publicationsraw;
create table EditionVISTAProdType as select distinct EditionVISTAProdType from publicationsraw;
create table EditionPriceSynchronisationTemplate as select distinct EditionPriceSynchronisationTemplate from publicationsraw;

select * from  VISTAPublisher;
select * from  WorkAlert ;
select * from  WorkStatus;
select * from  Imprint;
select * from  CommissioningEditor;
select * from  ProductType;
select * from  EditionTarget;
select * from  Binding;
select * from  Format;



select * from  EditionVISTAProdType;
select * from  EditionPriceSynchronisationTemplate;



drop table publicactionswork;

//
CREATE TABLE publicationswork (
WorkRef VARCHAR (255), 
VISTAPublisher VARCHAR (255) ,
PublicationDate date,
WorkAlert VARCHAR (255) ,
ExcludedFromConfirmation VARCHAR (255) ,
ConfirmationRestrictionAdded VARCHAR (255) ,
ConfirmationNotes VARCHAR (255) ,
WorkStatus VARCHAR (255) ,
Imprint VARCHAR (255) ,
CommissioningEditor VARCHAR (255) ,
ISBN VARCHAR (13) primary key,
ProductType VARCHAR(255) ,
EditionTarget VARCHAR(255),
Binding VARCHAR(255) ,
Format VARCHAR(255) ,
EditionVISTAProdType VARCHAR(255),
EditionPriceSynchronisationTemplate VARCHAR(255),
EditionExtent VARCHAR(255),
EditionEmbargoedUntil VARCHAR(255),
IsSecondFormat Boolean
);


/* excluded binding types not recognised until they can be qualified in. */
insert into publicationswork
select * from publicationsraw
where Binding in ('Paperback', 'Hardback','Trade Paperback')
and publicationdate ; 

update publicationswork
set isSecondFormat


select workref from publicationswork 
group by workref 
having count(*) > 3;


select a.workref, a.isbn, b.isbn, a.publicationdate as secondFormatDate, b.publicationdate as firstFormatDate, 
from publicationswork a, publicationswork b
where a.workref = b.workref
and a.binding = 'Paperback' and b.binding != 'Paperback'
and a.publicationdate >= b.publicationdate
order by a.workref;

