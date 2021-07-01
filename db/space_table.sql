CREATE TABLE spaces ( 
    id SERIAL PRIMARY KEY
   ,name VARCHAR(50)
   ,description VARCHAR(250)
   ,price VARCHAR(40)
);

ALTER TABLE spaces
ADD COLUMN date_avail DATE;

ALTER TABLE spaces
ADD COLUMN host_email VARCHAR(40)