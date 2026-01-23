-- 테이블 삭제
DROP TABLE member;
DROP TABLE board;
DROP TABLE product;
DROP TABLE orders;
-- 참조 무결성 때문에 orders 테이블을 먼저 삭제한다.
-- 왜래키(px)가 지정되어있는 테이블을 먼저 삭제
-- member 테이블보다 먼저 삭제한다

-- 테이블 생성
CREATE TABLE member (
  member_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  age INT,
  gender CHAR(1),
  point INT,
  grade VARCHAR(20),
  regdate DATE
);

CREATE TABLE board (
  board_no INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(200),
  writer VARCHAR(50),
  view_cnt INT,
  regdate DATE
);

CREATE TABLE product (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  product_name VARCHAR(100),
  price INT,
  stock INT,
  category VARCHAR(50)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  member_id INT,
  total_price INT,
  status VARCHAR(30),
  order_date DATE
);

/*
	DML(데이터 조작 언어)
		1.INSERT INTO 테이블명(컬럼명,..) VALUES (값,...)
			-삽입 -> Create
		2.SELECT 컬럼명,.. FROM 테이블명 WHERE 조건
			-조회 -> Read
        3.UPDATE
			-갱신 -> Update
        4.DELETE FROM 테이블명
			-삭제 -> Delete
*/

-- 데이터(행, 튜플) 삽입하기
INSERT INTO member VALUES
(1,'홍길동',35,'M',500,'VIP','2023-01-01'),
(2,'이순신',22,'M',200,'BRONZE','2022-01-01'),
(3,'김영희',19,'F',0,'BRONZE','2025-01-01'),
(4,'박철수',45,'M',900,'GOLD','2021-01-01'),
(5,'최민수',31,'F',700,'SILVER','2024-01-01');

INSERT INTO board VALUES
(1,'테스트 글','hong',0,'2022-01-01'),
(2,'공지사항','admin',200,'2023-01-01'),
(3,'자유글','hong',10,'2025-01-01'),
(4,'테스트 게시글','kim',5,'2021-01-01');

INSERT INTO product VALUES
(1,'노트북',150000,10,'전자제품'),
(2,'마우스',20000,0,NULL),
(3,'키보드',30000,50,'전자제품');

INSERT INTO orders VALUES
(1,1,120000,'주문완료','2025-01-01'),
(2,2,50000,'취소','2023-01-01'),
(3,3,0,'취소','2024-01-01'),
(4,5,300000,'주문완료','2025-02-01');

-- 조회 하기
-- SELECT * FROM [스키마.]테이블;->*는 모든컬럼
-- 서로 다른 스키마에서 같은 이름의 테이블이 없다면 스키마명은 생략 가능.
SELECT * FROM mydb.member;
SELECT * FROM board;
SELECT * FROM product;
SELECT * FROM orders;

-- member 테이블
-- 1. member 테이블의 모든 데이터를 조회하시오.
SELECT * FROM member;
-- 2. 회원의 이름과 나이만 조회하시오.
SELECT name, age FROM member;
-- 3. 등급이 VIP인 회원을 조회하시오.(절로 나누어 아래로 쓰는 경향이 있음)
SELECT * 
FROM member 
WHERE grade = 'VIP'; -- VIP로만 쓰면 변수로 인식 error
-- 4. 나이가 30 이상인 회원을 조회하시오.
SELECT * 
FROM member 
WHERE age >= 30;
-- 5. 성별이 여자이고 포인트가 500 이상인 회원을 조회하시오.
SELECT * 
FROM member 
WHERE gender = 'F' AND point >= 500;
-- 6. 등급이 GOLD 또는 VIP인 회원을 조회하시오.
-- 7. 포인트가 200~800 사이인 회원을 조회하시오.
-- 8. 등급이 BRONZE, SILVER인 회원을 조회하시오.

-- board 테이블
-- 9. 제목에 '테스트'가 포함된 게시글을 조회하시오.

-- product 테이블
-- 10. 카테고리가 NULL인 상품을 조회하시오.
-- 11. 회원을 포인트 내림차순으로 조회하시오.
-- 12. 포인트 상위 3명의 회원을 조회하시오.
-- 13. 회원의 평균 포인트를 조회하시오.
-- 14. 등급별 회원 수를 조회하시오.
-- 15. 회원 수가 2명 이상인 등급만 조회하시오.
-- 16. 평균 포인트 이상인 회원을 조회하시오.

-- orders 테이블
-- 17. 주문을 한 회원의 정보만 조회하시오.
-- 18. 주문 정보와 회원 이름을 함께 조회하시오.
-- 19. 주문이 없는 회원도 포함하여 조회하시오.
-- 20. 주문 상태의 종류를 중복 없이 조회하시오.








