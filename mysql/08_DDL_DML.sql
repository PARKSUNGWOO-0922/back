-- 실행: ctrl+enter

-- DDL: DB와 테이블 생성, 삭제
-- DB 생성
CREATE DATABASE doitsql;

-- DB 삭제
DROP DATABASE doitsql;

-- DB 사용
USE doitsql;

-- 테이블 생성
CREATE TABLE doit_dml (
	col_1 INT,
	col_2 VARCHAR(50),
	col_3 DATETIME
);

-- 테이블 삭제
DROP TABLE doit_dml;

-- DML
-- 삽입(Create)
INSERT INTO doit_dml (col_1, col_2, col_3) 
VALUES (1, 'DoItSQL', '2023-01-01');

-- 데이터 타입이 맞지 않음 (Error)
INSERT INTO doit_dml(col_1) 
VALUES ('문자 입력');

INSERT INTO doit_dml 
VALUES (2, '열 이름 생략 ', '2023-01-02');

-- 컬럼명을 생략할 경우
-- 테이블에서 정의한 컬럼 개수와 
-- insert 문으로 삽입할 값의 개수와 데이터 타입이 일치하지 않으면 Error
INSERT INTO doit_dml 
VALUES (3, 'col_3 값 생략');

-- 값을 입력하지 않은 열은 NULL로 지정
INSERT INTO doit_dml(col_1, col_2)
VALUES (3, 'col_3 값 생략');

-- 컬럼 순서를 바꿔도 데이터 타입이 일치하면 된다.
INSERT INTO doit_dml(col_1, col_3, col_2) 
VALUES (4,'2023-01-03', '열순서 변경');

-- 여러 데이터를 한 번에 삽입
INSERT INTO doit_dml(col_1, col_2, col_3) VALUES 
(5, '데이터 입력5', '2023-01-03'),
(6, '데이터 입력6', '2023-01-03'), 
(7, '데이터 입력7', '2023-01-03');

-- 갱신(수정, Update)
UPDATE doit_dml 
SET col_2 = '데이터 수정'
WHERE col_1 = 4;

-- WHERE을 생략하면 
-- 해당 컬럼의 데이터 전체가 갱신
UPDATE doit_dml 
SET col_1 = col_1 + 10;

-- 삭제(Delete)
DELETE FROM doit_dml 
WHERE col_1 = 14;

-- 데이터 전체 삭제
DELETE FROM doit_dml;

-- 조회(Read)
SELECT * FROM doit_dml;

