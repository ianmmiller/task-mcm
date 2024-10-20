# task-mcm
interview task repo

Setup:
* Tools
** install [Tableau Desktop](https://www.tableau.com/en-gb/trial/tableau-software)
** install register with [Github](https://github.com/signup?ref_cta=Sign+up&ref_loc=header+logged+out&ref_page=%2F&source=header-home)
*** create a repo task-mcm
*** setup github->Settings->Developer Settings->Personal access tokens
*** install git on your mac and clone the repo...
** install [Postgres 11.22-1-0sx](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)
*** record the port number suggested and the password you recorded for "postgres" user.
*** once installed, run pgadmin4, select the PostgreSQL server and, when you've connected, create a new database "task-mcm"
** install [postgres driver](https://jdbc.postgresql.org/download/postgresql-42.7.4.jar) and copy to ~/Library/Tableau/Drivers and then restart Tableau.
** install [dbeaver](https://dbeaver.io/download/)
*** create new project for task-mcm
*** create Connection to the postgres database.


* Data
** Export the Excel data to a .csv file under your Github repo path.
** Go to dbeaver, select the database you've created and right click to import data, selecting the csv file. This will load the data into a publisherraw table that includes all rows, regardless of format errors. Note that you need to set the import settings to set empty strings to null. Also make sure date format is dd-MM-yyyy.
** execute the commands to create the ref data tables so you can see the rough sstructure of the data.


* Data Quality
** Checked that ISBN is the correct primary key using this SQL
`select isbn from publicationsraw
group by isbn 
having count(*) > 1;`
** Created a working table to clean up data - publisherwork


Structure:

* Initial assessment of data set
* Analyse and propose data types for each 
* Identify primary key
* Identify foreign keys
* Apply conditions to restrict to known good values and filter out anything not matching
