-- Active: 1769391941753@@127.0.0.1@3306@mydb
-- 테이블 삭제
DROP TABLE member;
DROP TABLE board;
DROP TABLE product;

-- 참조 무결성 때문에 orders 테이블을 먼저 삭제한다.
-- orders 테이블은 외래키(FK)가 지정되어있어
-- member 테이블보다 먼저 삭제한다.
DROP TABLE orders;
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
/* 

    하나의 INSERT 문에 소괄호로 묶은 VALUES값을 사용하면
    하나의 INSERT 구문으로 데이터를 여러 행 입력할 수 있어
    INSERT INTO 테이블명 [(열1, 열2, ...)]
    VALUES [(값1, 값2, ...), (값1, 값2, ...), ...];
      - 테이블 뒤에 열 이름을 생략하려면
        VALUES문 뒤에 테이블의 열 순서와 개수에 맞춰 데이터를 채워야 함

    INSERT INTO 테이블명 (member_id, name, age, gender, point, grade, regdate) 
    VALUES (1,'홍길동',35,'M',500,'VIP','2023-01-01');

    INSERT INTO 테이블명 (age, name, gender, point, grade) 
    VALUES (35,'홍길동','M',500,'VIP');
*/
-- 데이터(행, 튜플, 레코드) 삽입하기
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
-- SELECT * FROM [스키마.]테이블;->*는 모든필드
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
WHERE grade = 'VIP'; -- VIP로만 쓰면 변수로 인식 error -- 문자열은 ' 또는 "로 묶는다.
-- 4. 나이가 30 이상인 회원을 조회하시오.
SELECT * 
FROM member 
WHERE age >= 30;
-- 5. 성별이 여자이고 포인트가 500 이상인 회원을 조회하시오.
SELECT * 
FROM member 
WHERE gender = 'F' AND point >= 500;

/* 
    MySQL에서 문자열 데이터를 조회할 때 대소문자 구분 여부
    -> 데이터 타입과 콜레이션(Collation) 설정에 따라 결정된다.

    utf8mb4_general_ci
      1) _ci(Case Insensitive): 대소문자 구별x
      2) _cs(Case Sensitive): 대소문자 구별
      3) _bin(Binary): 데이터를 이진값으로 비교, 대소문자 구별
    
    BLOB, BINARY 데이터 타입은 콜레이션 설정과 관계없이 대소문자를 구분한다.
    부울값(TRUE, FALSE)은 TINYINT(1) 데이터 타입이므로
    -> 콜레이션 설정과 관계없이 대소문자를 구분하지 않는다.


 */
-- 6. 등급이 GOLD 또는 VIP인 회원을 조회하시오.

SELECT * FROM member 
WHERE grade = 'GOLD' OR grade = 'VIP';

SELECT * FROM member 
WHERE grade IN( 'GOLD' , 'VIP');
/* 
    범위/집합 연산자
     BETWEEN A AND B -> A와 B 사이 (A,B포함)
  
 */
-- 7. 포인트가 200~800 사이인 회원을 조회하시오.
SELECT * FROM member
WHERE point >= 200 AND point <= 800;

SELECT * FROM member
WHERE point BETWEEN 200 AND  800;
-- 8. 등급이 BRONZE, SILVER인 회원의 이름과 등급만 조회하시오.
SELECT name,grade FROM member
WHERE grade = 'BRONZE' OR grade = 'SILVER';

SELECT name,grade FROM member
WHERE grade IN ('BRONZE' , 'SILVER');

SELECT name FROM member 
WHERE (name BETWEEN '가' AND '나')  -- '가'부터 '나' 직전까지 (ㄱ으로 시작하는 모든 성)
   OR (name BETWEEN '아' AND '자'); -- '아'부터 '자' 직전까지 (ㅇ으로 시작하는 모든 성)
-- board 테이블
/* 
  패턴 연산자
    % 0개 이상의 문자
    _ 1개문자

    예)'테스트'가 포함된 -> %테스트%
    예)'테스트'로 시작하는 -> 테스트%
    예)'테스트'로 끝나는 -. %테스트
    예)'테스트'로 시작하는 4자리문자 -> 테스트_ 
 */
-- 9. 제목에 '테스트'가 포함된 게시글을 조회하시오
SELECT * FROM board
WHERE title LIKE '%테스트%';

-- product 테이블
/* 
  NULL 관련 연산자
    IN NULL     -> NULL 이다
    IS NOT NULL -> NULL이 아니다
 */
-- 10. 카테고리가 NULL인 상품을 조회하시오.
SELECT * FROM product
WHERE category IS NULL;
/* 
  SELECT 컬럼1,컬럼2,...
  FROM 테이블명
  [WHERE 조건]
  [ORDER BY 컬럼 ASC|DESC]

    - 정렬:ASC(오름차준,기본값(생략시)),DESC(내림차순)
 */
-- 11. member 테이블에서 회원을 포인트 내림차순으로 조회하시오.(product에 point필드가 읍따)
SELECT * FROM member
ORDER BY point DESC; -- 내림차순

SELECT * FROM member
ORDER BY point ; -- 오름차순

/* 
  SELECT 컬럼1,컬럼2,...
  FROM 테이블
  WHERE 조건
  ORDER BY 컬럼 [ASC] [DESC]
  LIMIT 행수;
 */
-- 12. member 테이블에서 포인트 상위 3명의 회원을 조회하시오.
SELECT * FROM member
ORDER BY point DESC
LIMIT 3; -- 포인트(point) 상위 3명의 회원 조회
/* 
  집계 함수
    1.count(컬럼)       행의 수 (NULL제외)
        -count(*)       전체 행 수(NULL 포함)
    2.sum(숫자컬럼)     합계(NULL 제외)
    3.age(숫자컬럼)     평균(NULL 제외)
    4.max(컬럼)         최대값   
    4.min(컬럼)         최솟값   
 */
 /* 
    SELECT 컬럼 [AS 별칭], 컬럼2 [AS 별칭],...
    FROM 테이블;
  */
-- 13. member 테이블에서 회원의 평균 포인트를 조회하시오.
SELECT AVG(point) AS 평균 FROM  member;


/* 
    SELECT 컬럼1, 컬럼2,...
    FROM 테이블
    WHERE 조건
    GROUP BY 컬럼 HAVING 그룹조건
    ORDER BY 컬럼
    LIMIT 행수

   WHERE와 HAVING의 가장 큰 차이점은 "필터링을 하는 시점"에 있습니다. WHERE는 그룹화 전에 개별 행을 필터링하고, HAVING은 그룹화 후에 집계된 결과를 필터링합니다

   SELECT 컬럼, 집계함수(컬럼)
FROM 테이블명
WHERE 개별_행_조건        -- 1단계: 전체 데이터에서 필요한 행만 먼저 뽑음
GROUP BY 그룹화할_컬럼    -- 2단계: 뽑힌 데이터를 그룹으로 묶음
HAVING 그룹_결과_조건     -- 3단계: 묶인 그룹 중에서 조건에 맞는 그룹만 남김


    -LIMIT는 MySQL 전용!

 */
-- 14. 등급별 회원 수를 조회하시오.
SELECT count(member_id) AS `회원 수`FROM member; --회원 수 처럼 공간이 있을대 `(백틱)사용한다.
SELECT grade, count(*) FROM member -- member 테이블에서 grade별로 묶어서 각 grade에 몇 명 있는지 세어라
GROUP BY grade;

-- 15. 회원 수가 2명 이상인 등급만 조회하시오.
SELECT grade as 등급, count(*) as 인원수 FROM member
GROUP BY grade HAVING  COUNT(*) >= 2;

SELECT grade, COUNT(*) AS cnt
FROM member
GROUP BY grade -- 같은 등급을 가진 회원들을 하나로 묶습니다. (예: 'Gold'끼리, 'Silver'끼리)
HAVING COUNT(*) >= 2; -- 묶인 그룹 중에서 인원수가 2명 이상인 그룹만 남깁니다.

/* 
  서브쿼리
  1.반드시 괄호()로 감싼다.
  2.안쪽 쿼리(서브쿼리)가 먼저 실행된다.
  3.select,from,where 등 열 위치에서 사용된다.
  4.스칼라 서브쿼리 -> select절의 서브쿼리
  5.인라인 뷰 -> from 절의 서브쿼리
  6.AS절:별칭(Alias) 부여
    -AS 절의 생략 여부:
      테이블은 생략권장,컬럼의 별창은 사용권장(관례)

   SELECT 컬럼
   FROM 테이블
   WHERE 컬럼 = (SELECT문장)

   SELECT 컬럼
   FROM (SELECT문장)
   WHERE 컬럼

   SELECT 컬럼 , (SELECT문장) AS 별칭
   FROM 테이블
   WHERE 컬럼
 */

-- 16. 평균 포인트 이상인 회원을 조회하시오.
-- 기록순서:SELECT절 -> FROM절 -> WHERE절
-- 실행순서:FROM절 -> WHERE절 -> SELECT절
-- member 테이블로부터 point가 평균(member 테이블로 부터 point 평균을 조회한다)이상인 모든 컬럼을 조회한다.


SELECT AVG(point) FROM member;
SELECT * FROM member
WHERE point >= (SELECT AVG(point) FROM member);

-- orders 테이블
-- 17. 주문을 한 회원의 정보만 조회하시오.
SELECT member_id FROM orders; --1,2,3,5
SELECT * FROM member
WHERE member_id IN(SELECT member_id FROM orders); 
/* 
  조인(join)
   - 둘 이상의 테이블을 연결
   - 키(Key):PK(기본키),FK(외래키)
    1 내부 조인(INNER JOIN)
    2 외부 조인
      -왼족 (외부) 조인(LEFT OUTER JOIN)
      -오른쪽 (외주)조인(RIGHT OUTER JOIN)

    SELECT 컬럼
    FROM 테이블a [INNER] JOIN 테이블b [ON 테이블a.컬럼 = 테이블b.컬럼]
    WHERE 조건

    SELECT 컬럼
    FROM 테이블a LEFT JOIN 테이블b [ON 테이블a.컬럼 = 테이블b.컬럼]
    WHERE 조건
 */
-- 18. 주문 정보와 회원 이름을 함께 조회하시오.
SELECT * FROM orders;
SELECT * FROM member;
SELECT * FROM member JOIN orders; --20table 모두출력
SELECT name,order_id,total_price FROM member JOIN orders; --20table name,order_id,total_price 컬럼만 출력
SELECT name,order_id,total_price FROM member JOIN orders ON member.member_id = orders.member_id; --정상 출력
SELECT member.member_id,name,order_id,total_price FROM member JOIN orders ON member.member_id = orders.member_id; --정상 출력
SELECT m.member_id,m.name,o.order_id,o.total_price FROM member m JOIN orders o ON m.member_id = o.member_id; --정상 출력(필드명 간략화한 별칭 표현) 구분이명확안경우 생략가능.

-- 19. 주문이 없는 회원도 포함하여 조회하시오.
-- LEFT JOIN: 왼쪽 원은 온전하고, 오른쪽 원은 겹치는 부분만 남습니다.
-- RIGHT JOIN: 오른쪽 원은 온전하고, 왼쪽 원은 겹치는 부분만 남습니다.
-- 매칭되는 데이터가 없으면 NULL 표시
SELECT m.member_id,m.name,o.order_id,o.total_price FROM member m LEFT JOIN orders o ON m.member_id = o.member_id; -- NULL(주문없는) 도표시
SELECT m.member_id,m.name,o.order_id,o.total_price FROM member m LEFT JOIN orders o ON m.member_id = o.member_id WHERE o.member_id is NOT NULL; -- NULL 아닌것만 표시
SELECT m.member_id,m.name,o.order_id,o.total_price FROM member m LEFT JOIN orders o ON m.member_id = o.member_id WHERE o.member_id is NULL; -- NULL 인것만 표시
/* 
  SELECT 컬럼1 DISTINT 컬럼2,...
  FROM 테이블1 JOIN 테이블2 ON  조건
  WHERE 조건
  GROUP BY 컬럼 HAVING 그룹조건
  ORDER BY 컬럼 ASC| DESC
  LIMIT 행수;
 */
-- 20. 주문 상태(status)의 종류를 중복 없이(distint) 조회하시오.
SELECT DISTINCT status FROM orders;

-- 21.board 테이블의 column을 확인하시오.
SHOW COLUMNS FROM board; -- 특정 테이블이 어떤 구조(스키마)로 이루어져 있는지를 확인하고 싶을 때 사용합니다.
                         -- 왜 이 명령어를 사용하나요?
                         -- 쿼리 작성 전 확인: 앞서 작성하신 grade 컬럼의 정확한 스펠링이나 데이터 타입(문자인지 숫자인지)을 확인할 때 필수 










