CREATE TABLE test(NAME VARCHAR(50), POINT INT);

INSERT INTO test VALUES("peace", 100);
INSERT INTO test (NAME, POINT) VALUES ("박평화", 100);
INSERT INTO test VALUES("ppp", 100);

SELECT * FROM test;
create table notice (no int primary key auto_increment, title varchar(200), content varchar(1000), regdate datetime default now(), visited int default 0);
DESC notice;

create table user (id varchar(16) primary key, pw varchar(20) not null, name varchar(20) not null, tel varchar(15), email varchar(50), birth varchar(10), resDate datetime default now());