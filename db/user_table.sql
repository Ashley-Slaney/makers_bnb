CREATE TABLE users (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(20), 
  email VARCHAR(40), 
  password VARCHAR(60)
);

alter table users alter column password varchar(60);