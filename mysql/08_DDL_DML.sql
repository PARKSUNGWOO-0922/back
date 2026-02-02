-- 실행
CREATE DATABASE doitsql;

DROP DATABASE doitsql;

USE doitsql;

CREATE TABLE
doit_dml(
col_1 INT,
col_2 VARCHAR(50),
col_3 DATETIME
);

DROP TABLE doit_dml;

INSERT INTO doit_dml (col_1,col_2,col_3)
VALUES (1,'DoTtSQL','2023-01-01');

INSERT INTO doit_dml 
VALUES (2,'열 이름 생략','2023-01-02');

INSERT INTO doit_dml 
VALUES (3,'col_3 값 생략'); -- error

INSERT INTO doit_dml (col_1,col_2)
VALUES (3,'col_3 값 생략'); 

INSERT INTO doit_dml (col_1,col_3,col_2)
VALUES (4,'2023-01-01','열순서변경');

UPDATE doit_dml
SET col_2 ='데이터수정'
WHERE col_1 = 4; 




SELECT * FROM doit_dml;
