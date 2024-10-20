CREATE TABLE Publications (
WorkRef VARCHAR (255) PRIMARY KEY, 
VISTAPublisher VARCHAR (255) ,
PublicationDate DATE, 
WorkAlert VARCHAR (255) ,
ExcludedFromConfirmation BOOLEAN,
ConfirmationRestrictionAdded BOOLEAN,
ConfirmationNotes TEXT, 
WorkStatus VARCHAR (255) ,
Imprint VARCHAR (255) ,
CommissioningEditor VARCHAR (255) ,
ISBN VARCHAR (13) , 
ProductType VARCHAR (255) , 
EditionTarget VARCHAR (255), 
Binding VARCHAR (255) , 
Format VARCHAR (255) ,
EditionVISTAProdType VARCHAR （255），
EditionPriceSyncTemplate VARCHAR （255）,
EditionExtent INT，
EditionEmbargoedUntil DATE,
CHECK (ProductType IN ('Book', "EBook', "Audio Digital Download', 'Board Book')
CHECK (WorkAlert IN ('Value1' "Value2', "Value3")), - Replace with actual valid values
CHECK (WorkStatus IN ('Acquired' "Published', -- Replace with actual valid values
CHECK (Imprint IN ('Campbell Books', "Pending')),
CHECK 'Tor' (EditionTarget IN (Main Market Ed.  "Picador' "Mantle', 'Macmillan', 'Bluebird')),
CHECK "Ebook', Audio'; 'Bundle")), -- Replace with actual valid values -- Replace with actual valid values
(Binding IN ('Paperback'
 CHECK (Format IN 'Hardback' ("B Format", *Demy', "Board Book')), -- Replace with actual valid values
'MP3 Format',
' epub')),
CHECK (EditionVISTAProdType IN ('Dig Ed Adobe',
'Online'
-- Replace with actual valid values
"Fiction Low',
'MCB High',
'On Demand*)), -- Replace with actual valid values
CHECK (EditionPriceSyncTemplate IN ('Templatel',
CHECK (EditionExtent › 0)
•Template2',
'Template3*)), -- Replace with actual valid values
-- Assuming extent should be a positive integer
);


CREATE TABLE VISTAPublisher (
	Publisher VARCHAR(255) PRIMARY KEY
);

ALTER TABLE Publications
    ADD FOREIGN KEY (VISTAPublisher) REFERENCES VISTAPublisher (Publisher);

CREATE TABLE Editor (
        EditorName VARCHAR(255) PRIMARY KEY
);

ALTER TABLE Publications
    ADD FOREIGN KEY (CommissioningEditor) REFERENCES Editor (EditorName);

CREATE TABLE ISBN (
        ISBN VARCHAR(13) PRIMARY KEY
);

ALTER TABLE Publications
    ADD FOREIGN KEY (ISBN) REFERENCES ISBN (ISBN);


