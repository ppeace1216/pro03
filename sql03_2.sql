CREATE TABLE test(NAME VARCHAR(50), POINT INT);

INSERT INTO test VALUES("peace", 100);
INSERT INTO test (NAME, POINT) VALUES ("박평화", 100);
INSERT INTO test VALUES("ppp", 100);

SELECT * FROM test;
create table notice (no int primary key auto_increment, title varchar(200), content varchar(1000), regdate datetime default now(), visited int default 0);
DESC notice;

create table user (id varchar(16) primary key, pw varchar(20) not null, name varchar(20) not null, tel varchar(15), email varchar(50), birth varchar(10), resDate datetime default now());
drop table user;
CREATE TABLE USER(
	id VARCHAR(30) PRIMARY KEY,
	pw VARCHAR(300) NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	POINT INT DEFAULT 0,
	grade VARCHAR(4) DEFAULT "F",
	visted INT DEFAULT 1,
	tel VARCHAR(11),
	addr VARCHAR(150),
	email VARCHAR(100),
	birth DATE,
	regdate DATETIME DEFAULT NOW()
);

select * from user;
UPDATE user SET grade="A" WHERE id="admin";
delete from user where id = "admin";
delete from user where id = "peace";
delete from user where id = "qwerty";

CREATE TABLE tour(
	no INT PRIMARY KEY AUTO_INCREMENT, 
	tourno varchar(20), 
	cate varchar(20), 
	title VARCHAR(200), 
	subtitle varchar(500), 
	content VARCHAR(1000), 
	regdate DATETIME DEFAULT NOW(), 
	visited INT DEFAULT 0
);
desc tour;
ALTER TABLE tour ADD COLUMN addr VARCHAR(200);
select * from tour;

create table pic(no INT PRIMARY KEY AUTO_INCREMENT, tourno varchar(20), picname varchar(100), pos int default 1);
desc pic;

create table impress(
	no int primary key auto_increment, 
	cate varchar(20), 
	tourno varchar(20), 
	id varchar(30),
	content varchar(500), 
	esti varchar(20),  
	regdate DATETIME DEFAULT NOW() 
);
drop table impress;
desc impress;
create table qna(
	
);
COMMIT;