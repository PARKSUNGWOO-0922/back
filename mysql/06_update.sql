/*
    INSERT INTO 테이블 (컬럼,...) 
    VALUES (값,...);

    SELECT 컬럼,...
    FROM 테이블
    WHERE 조건;
    
    UPDATE 테이블
    SET 컬럼 = 값, ...
    WHERE 조건;

    DELETE FROM 테이블
    WHERE 조건;
*/
DELETE FROM member;
DELETE FROM orders;
DELETE FROM board;
DELETE FROM product;

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

SELECT * FROM member;
SELECT * FROM board;
SELECT * FROM product;
SELECT * FROM orders;
-- 1. member_id가 3인 회원의 포인트를 100으로 수정하시오.
UPDATE member
SET point = 100
WHERE member_id = 3;
-- 2. 이름이 '이순신'인 회원의 등급을 GOLD로 변경하시오.
UPDATE  member
SET grade = 'GOLD'
WHERE name = '이순신';
-- 3. 포인트가 800 이상인 회원의 등급을 VIP로 변경하시오.
UPDATE member
SET grade = 'VIP'
WHERE point >= 800;
-- 4. 성별이 F이고 포인트가 700 이상인 회원의 등급을 GOLD로 변경하시오.
UPDATE member
SET grade = 'GOLD'
WHERE gender = 'F' AND point >= 700;
-- 5. 등급이 BRONZE이거나 SILVER인 회원의 포인트를 100 증가시키시오.
UPDATE member
SET point = point + 100
WHERE grade = 'BRONZE' OR grade = 'SILBER';
UPDATE member
SET point = point + 100
WHERE grade IN('BRONZE','SILVER');
-- 6. 주문 번호가 1~2 사이인 주문의 상태를 '배송중'으로 수정하시오.
UPDATE orders
SET status = '배송중'
WHERE order_id BETWEEN 1 AND 2;
-- 7. 2023년 이전에 가입한 회원의 등급을 OLD로 변경하시오.
UPDATE member
SET grade ='OLD'
WHERE regdate < '2023-01-01';
-- 8. 카테고리가 NULL인 상품의 카테고리를 '기타'로 수정하시오.
UPDATE product
SET category = '기타'
WHERE category IS NULL; -- 'NULL'아닌것에 주의
-- 9. 제목에 '테스트'가 포함된 게시글의 조회수를 0으로 수정하시오.
UPDATE board
SET view_cnt = 0
WHERE title LIKE '%테스트%'; -- 
-- 10. 모든 상품의 가격을 10% 인상하시오.
UPDATE product
SET price =  price * 1.1;

-- 11. 평균 포인트 이상인 회원의 등급을 우수회원으로 수정하시오.
/*
    MySQL은 UPDATE나 DELETE를 할 때, 수정 대상이 되는 테이블을 서브쿼리에서 동시에 직접 참조하는 것을 방지합니다.
    이 문제를 해결하기 위해 서브쿼리를 한 번 더 감싸서(SELECT avg_point FROM (...)) 가상의 임시 테이블을 만듭니다.
    이때 데이터베이스 입장에서 이 임시 테이블을 부를 이름이 필요한데, 그것이 바로 **AS temp (별칭)**입니다.
*/
SELECT AVG(point) FROM member; -- 620
UPDATE member
SET grade = '우수'
WHERE point >= (SELECT avg_point FROM (SELECT AVG(point) AS avg_point FROM member) AS temp); 
-- 12. 게시글을 2개 이상 작성한 작성자의 게시글 제목을 '다수작성자'로 수정하시오.
UPDATE board
SET title = '다수작성자'
WHERE writer IN (
    SELECT writer FROM (
        SELECT writer
        FROM board
        GROUP BY writer
        HAVING COUNT(*) >= 2
    ) AS temp
);
/*
    UPDATE board
SET title = '다수작성자'
WHERE writer IN (
    SELECT writer FROM (
        SELECT writer
        FROM board
        GROUP BY writer
        HAVING COUNT(*) >= 2
    ) AS temp

    가장 안쪽 서브쿼리: * GROUP BY writer: 작성자별로 그룹을 묶습니다.

        HAVING COUNT(*) >= 2: 묶인 그룹 중 게시글 수가 2개 이상인 작성자만 필터링합니다.

        AS temp (중요!): * 위에서 필터링한 작성자 명단을 temp라는 이름의 임시 보관함에 담습니다. 
        이렇게 해야 MySQL이 "수정할 테이블을 직접 참조하고 있네?"라고 오해하지 않습니다.

        WHERE writer IN (...): * board 테이블의 작성자가 임시 보관함(temp)에 들어있는 
        '다수 작성자' 명단에 포함되어 있다면 수정을 진행합니다.
        * writer IN (...)은 괄호 안에 나열된 여러 개의 값 중 하나라도 일치하는 것이 있는지 체크합니다.

        SET title = '다수작성자': * 해당되는 게시글들의 제목을 일괄 변경합니다

        . COUNT(*) vs COUNT(writer)의 차이
        가장 큰 차이는 NULL(빈 값)을 포함하느냐 아니냐에 있습니다.
        참고)NULL 이 2개이상인 경우 GROUP BY 되지만 IN 에 의해서 true/false로 판단을 못한다. 그래서 변경이 안일어난다
            만약 굳이 변경을 원하면 IS NULL 을 사용한다.
);
*/

-- 13. 우수회원(member)의 주문상태(orders)를 'VIP주문'으로 수정하시오.
/*
    1.orders 테이블의 member_id(두 번째 컬럼)와 member 테이블의 id(첫 번째 컬럼)를 연결

    2.(JOIN사용):두 테이블을 직접 연결해서 member 테이블의 grade가 'VIP'인 데이터만 골라 orders 테이블을 수정
     추천(JOIN)
    UPDATE orders AS o
    JOIN member AS m ON o.member_id = m.id
    SET o.status = 'VIP주문'
    WHERE m.grade = '우수';

    3.(서브쿼리이용시)
    UPDATE orders
    SET status = 'VIP주문'
    WHERE member_id IN (
    SELECT id FROM (
    SELECT id 
    FROM member 
    WHERE grade = '우수'
    ) AS temp
    );
    
    <참고> 별칭 선언시 해석 순서
    조회(SELECT): FROM부터 읽고 나중에 SELECT의 별칭을 붙인다.

    수정(UPDATE): UPDATE에서 바로 대상을 찍고 별칭을 붙여서 뒤에서 바로 쓴다.

    연결(JOIN): 어떤 문법이든 공통된 Key만 있으면 서로 다른 테이블을 엮어낼 수 있다!
*/
 UPDATE orders
    SET status = 'VIP주문'
    WHERE member_id IN (
    SELECT member_id FROM (
    SELECT member_id 
    FROM member 
    WHERE grade = '우수'
    ) AS temp
    );

-- 14. 회원 ID 1의 포인트를 1000으로, 등급을 TOP으로 수정하시오.
UPDATE member
SET point = 1000, grade = 'TOP'
WHERE member_id = 1;
-- 15. 모든 게시글의 조회수를 1 증가시키시오.
UPDATE board
SET view_cnt = view_cnt + 1;