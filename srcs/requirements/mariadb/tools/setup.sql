
CREATE DATABASE IF NOT EXISTS $DB_NAME ;

CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;

GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;

-- ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;

FLUSH PRIVILEGES ;

-- this is my gf's code
-- CREATE DATABASE IF NOT EXISTS HappyFam ;
-- use HappyFam;
-- create table if not EXISTS hmmm ( 
-- 	HmID nvarchar(50) not null primary key,
-- 	name nvarchar(50),
-- 	age int(50),
-- 	spouse nvarchar(50)
-- );
--
-- insert into hmmm values
-- ('Hm01', 'IjonTan', 25, 'ElysiaLiewYeeShian'),
-- ('Hm02', 'ElysiaLiewYeeShian', 18, 'IjonTan');
--
