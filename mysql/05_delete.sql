
/* 
    SQL
        1.DDL:
            - DB생성,삭제
            - 테이블 생성,삭제,변경
        2.DML:
            -SELECT     READ
            -INSERT     CREATE
            -UPDATE     UPDATE
            -DELETE     DELETE
        3.DCL+TCL
 */
 /* 
    DELETE FROM 테이블
    WHERE 조건
  */
-- 1. member_id가 3인 회원을 삭제하시오.
SELECT * FROM member;
DELETE FROM member
WHERE member_id = 3;
-- 2. 이름이 '중복회원'인 회원을 삭제하시오.
DELETE FROM member
WHERE name = '중복회원'; -- "0개의 행이 삭제됨"도 성공적인 수행입니다, 그래서 에러 안남.

-- 3. 나이가 25 미만인 회원을 삭제하시오.
DELETE FROM member
WHERE age < 25;
-- 4. 성별이 F이고 등급이 SILVER인 회원을 삭제하시오.
DELETE FROM member
WHERE gender = 'F' AND grade ='SILVER';
-- 5. 등급이 VIP 또는 GOLD인 회원을 삭제하시오.
DELETE FROM member
WHERE grade IN ('VIP','GOLD');
-- 6. 주문 번호가 1~2 사이인 주문을 삭제하시오.
SELECT * FROM orders;
INSERT INTO member VALUES
(1,'홍길동',35,'M',500,'VIP','2023-01-01'),
(2,'이순신',22,'M',200,'BRONZE','2022-01-01'),
(3,'김영희',19,'F',0,'BRONZE','2025-01-01'),
(4,'박철수',45,'M',900,'GOLD','2021-01-01'),
(5,'최민수',31,'F',700,'SILVER','2024-01-01');
SELECT * FROM member;
-- 7. 2022년 이전에 가입한 회원을 삭제하시오.
DELETE FROM member
WHERE regdate < '2022-01-01';
-- 8. 카테고리가 NULL인 상품을 삭제하시오.
DELETE FROM product
WHERE category IS NULL;
-- 9. 제목에 '테스트'가 포함된 게시글을 삭제하시오.
DELETE FROM board
WHERE title LIKE '%테스트%'; 
-- 10. 주문 테이블의 평균 주문 금액보다 작은 주문을 삭제하시오.
SELECT AVG(total_price)FROM orders; -- 117500.0000
DELETE  FROM orders
WHERE total_price < (SELECT AVG(total_price)FROM orders); -- Error Code: 1093. You can't specify target table 'orders' for update in FROM clause
        -- 이 오류의 의미는 **"데이터를 지우려는(DELETE) 대상 테이블에서, 
        -- 동시에 데이터를 뽑아와(SELECT) 비교 조건으로 쓸 수 없다"**는 뜻입니다. 
        -- MySQL은 데이터의 일관성을 위해 수정 중인 테이블을 하위 쿼리에서 직접 참조하는 것을 막아두었기 때문입니다.

DELETE  FROM orders
WHERE total_price < (SELECT avg_price FROM (SELECT AVG(total_price) AS avg_price FROM orders) AS temp_table);
        -- . 해결 방법: "임시 테이블"로 속이기 (Double Subquery)
        -- 이 문제를 해결하는 가장 흔한 트릭은 서브쿼리를 한 번 더 감싸서 별칭(Alias)을 주는 것입니다. 
        -- 이렇게 하면 MySQL은 서브쿼리의 결과를 별도의 임시 테이블로 간주하여 오류를 피할 수 있습니다.

        -- 왜 이렇게 하나요?
        -- 안쪽의 SELECT가 먼저 실행되어 평균값을 계산하고, temp_table이라는 임시 공간에 저장합니다.
        -- DELETE 문은 orders 테이블이 아니라 이 임시 공간에서 값을 읽어오기 때문에 충돌이 발생하지 않습니다.

-- 11. 게시글을 2개 이상 작성한 작성자의 게시글을 삭제하시오.
INSERT INTO board VALUES (6,'공지사항','admin',200,'2023-01-01'); -- 데이터가 부족해서 한행 추가작업,board_no INT PRIMARY KEY AUTO_INCREMENT 이므로 최종숫자보다 큰거입력 해야함.
INSERT INTO board VALUES (7,'공지사항','admin',400,'2026-01-26');
INSERT INTO board(title,writer,view_cnt,regdate) VALUES ('공지사항','admin',400,'2026-01-26'); -- board_no (px아므로)를 생략하고 추가로 입력하는 예시 

-- "글을 2개 이상 쓴 사람의 명단을 **별도의 임시 종이(temp)**에 먼저 적어놓고, 그 종이를 보면서 원본 테이블에서 해당 이름을 가진 데이터를 싹 지우는 쿼리"입니다.
DELETE FROM board
WHERE writer IN (
    SELECT writer FROM (
        SELECT writer 
        FROM board 
        GROUP BY writer 
        HAVING COUNT(writer) > 2
    ) AS temp
);

-- 12. 등급이 BRONZE인 회원의 주문을 삭제하시오.
-- join 모양 출력해보기
SELECT * FROM orders AS o JOIN member AS m
ON o.member_id = m.member_id;;
INSERT INTO orders VALUES -- 삭제많이되서 다시table만듬
(6,6,120000,'주문완료','2025-01-01'),
(2,2,50000,'취소','2023-01-01'),
(3,3,0,'취소','2024-01-01'),
(5,5,300000,'주문완료','2025-02-01');
-- 지워질 주문 목록 미리보기
SELECT o.*, m.name, m.grade
FROM orders o
JOIN member m ON o.member_id = m.member_id
WHERE m.grade = 'BRONZE';
-- 실질 삭제 코드
DELETE o                 -- 3. 최종적으로 orders(o) 테이블의 데이터를 지우겠다!
FROM orders AS o         -- 1. orders 테이블과
JOIN member AS m         -- 2. member 테이블을 연결(JOIN)한다.
  ON o.member_id = m.member_id
WHERE m.grade = 'BRONZE'; -- 4. 단, 회원의 등급이 BRONZE인 경우만!
-- 13. 주문 상태가 '취소'인 주문을 삭제하시오.
DELETE FROM orders
WHERE status = '취소';
-- 14. board 테이블의 모든 데이터를 삭제하시오.
-- DELETE * FROM board; DELETE 문법에서는 *(애스터리스크)을 사용하지 않기 때문
DELETE FROM board;
-- 15. 같은 제목의 게시글이 여러 개일 경우, 가장 최근 글을 제외하고 삭제하시오.


SELECT * FROM board;
DELETE b1
FROM board b1 JOIN board b2     -- 셀프 조인(Self Join) 같은 테이블을 조인
ON b1.title = b2.title          -- 1. 제목이 같은 것끼리 짝을 짓는다.
AND b1.board_no < b2.board_no; ;  --  2. 나(b1)보다 번호가 더 큰 글(b2)이 존재한다면 삭제! / 어차피 순서대로 작성되니까. 물록regdate도 가능