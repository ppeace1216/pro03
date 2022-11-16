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

CREATE TABLE tour(no INT PRIMARY KEY AUTO_INCREMENT, tourno varchar(10) not null, cate varchar(10) not null, title VARCHAR(200), subtitle varchar(500), content VARCHAR(1000), regdate DATETIME DEFAULT NOW(), visited INT DEFAULT 0);
desc tour;
create table pic(no INT PRIMARY KEY AUTO_INCREMENT, tourno varchar(10) not null, picname varchar(30), pos int default 1);
desc pic;
COMMIT;