SELECT * FROM member;
SELECT * FROM board;
SELECT * FROM product;
SELECT * FROM orders;

INSERT INTO member VALUES
(1,'홍길동',35,'M',500,'VIP','2023-01-01'),
(2,'이순신',22,'M',200,'BRONZE','2022-01-01');

INSERT INTO board VALUES
(1,'공지사항','admin',100,'2024-01-01');

INSERT INTO product VALUES
(1,'노트북',150000,10,'전자제품');

INSERT INTO orders VALUES
(1,1,120000,'주문완료','2025-01-01');


-- 1. member 테이블에 새로운 회원을 1명 추가하시오.
INSERT INTO member (member_id) VALUES(4
);
INSERT INTO member (member_id,name,age,gender,point,grade,regdate) VALUES(
    6,'이기자',20,'F',20,'SILVER','2026-01-28'
); -- 전체 입력일 경우 필드명 생략가능
UPDATE member
SET gender = 'M'
WHERE member_id = 4; -- 중요! 이걸 빼면 모든 행의 데이터가 바뀝니다.
/* 
    날짜/시간 함수
        CURDATE()       현재 날짜           YYYY-MM-DD
        NOW()           현재 날짜아 시간    YYYY-MM-DD HH:MM:SS
 */

-- 2. 이름, 나이, 성별만 지정하여 회원을 추가하시오.
INSERT INTO member (name,age,gender) VALUES(
    '홍만호',25,'M'
);
-- 3. 회원 번호는 자동 증가로 두고 회원을 추가하시오.
INSERT INTO member (name,age,gender,point,grade,regdate) VALUES(
    '김철수',45,'F',200,'GOLD','2026-01-23'
); 
-- 4. 회원 2명을 한 번에 추가하시오.
INSERT INTO member VALUES
(9,'홍길서',38,'M',500,'VIP','2025-01-01'),
(10,'김순신',28,'M',200,'BRONZE','2024-01-01');
-- 5. 카테고리가 없는 상품을 추가하시오.
SELECT * FROM product;
INSERT INTO product (product_name,price,stock,category) VALUES
('USB케이블',5000,100,NULL);
-- 6. 조회수 기본값을 사용하여 게시글을 추가하시오.
SELECT * FROM board;
INSERT INTO board (title,writer,regdate) VALUES
('첫번째 게시글','admin',CURDATE());
-- 기본값 0 변경후
INSERT INTO board (title,writer,regdate) VALUES
('첫번째 게시글','admin',CURDATE());

-- 7. 오늘 날짜로 주문 정보를 추가하시오.
SELECT * FROM orders;
INSERT INTO orders VALUES
(2,2,150000,'competed',CURDATE());
-- 8. VIP 회원의 ID를 사용하여 주문을 추가하시오.
SELECT * FROM member WHERE grade = 'VIP';


INSERT INTO orders (member_id, total_price, status, order_date)
SELECT member_id, 250000, 'pending', CURRENT_DATE
FROM member
WHERE grade = 'VIP';
/*
    코드가 작동하는 원리:

    FROM member WHERE grade = 'VIP': 우선 회원 테이블에서 등급이 VIP인 사람들을 모두 찾습니다.

    SELECT id, 250000, 'pending', CURRENT_DATE: 찾은 사람들의 id값 옆에 나머지 주문 정보(금액, 상태, 날짜)를 붙여서 임시 표를 만듭니다.

    INSERT INTO orders (...): 그 임시 표의 내용을 orders 테이블에 그대로 저장합니다

    *참고 : CURRENT_DATE: 표준 SQL(ANSI SQL) 규격입니다. 즉, MySQL뿐만 아니라 PostgreSQL, Oracle 등 다른 데이터베이스 시스템에서도 널리 쓰이는 표준 표현입니다.
            CURDATE(): MySQL(및 MariaDB) 전용 줄임말 함수입니다. 타이핑이 짧아서 편리하지만, 다른 DB로 옮길 때는 작동하지 않을 수 있습니다.
*/
-- 8-1. 누가 VIP인지 이름은 모르지만, 그중 가장 최근에 가입한 사람 1명에게만 혜택(주문)을 주고 싶다면 ORDER BY와 LIMIT을 섞어 쓰면 됩니다.
/*
    INSERT INTO orders (member_id, total_price, status, order_date)
    SELECT member_id, 250000, 'pending', CURRENT_DATE
    FROM member
    WHERE grade = 'VIP'
    ORDER BY join_date DESC  -- 최근 가입일 순서로 정렬
    LIMIT 1;                 -- 그중 딱 1명만 선택
*/

-- 9. 중복 키 오류가 발생해도 무시하고 회원을 추가하시오.
/*
    특수한 INSERT문
         INSERT IGNORE INTO테이블
         VALUES (값,...)
         ON DUPLICATE KEY UPDATE 컬럼
            이코드 의미: "이미 있는 회원이면 정보를 최신으로 바꿔줘", 그래서 무시하고 추가
            라는 문제가 일반적이지 못하다 . 추가는 할수 없다는 뜻.

            중복되면 그냥 무시하기 (INSERT IGNORE)
            가장 단순한 방법입니다. PRIMARY KEY나 UNIQUE 제약 조건이 걸린 컬럼에 이미 같은 값이 있다면,
            에러를 내지 않고 해당 데이터만 조용히 건너뜁니다.

            1. SQL 툴 (MySQL Workbench, DBeaver 등)에서 쓸 때
                대부분의 툴은 친절하기 때문에 경고(Warning) 메시지를 보여줍니다.
                하단 결과창(Action Output)에 노란색 느낌표가 뜹니다.
                메시지에는 1 row(s) affected, 1 warning(s)라고 찍힙니다.
                이때 SHOW WARNINGS;를 입력하면 "중복된 키가 있다"는 구체적인 내용을 볼 수 있습니다.

        그래서 명령문이 무시된것지, 실행된것인지를 확인하는 방법이 있다..EX)SELECT ROW_COUNT();
            1. ROW_COUNT()의 작동 원리
            이 함수는 바로 직전에 실행된 INSERT, UPDATE, DELETE 문에 의해 영향을 받은 행(Row)의 개수를 반환합니다.

            INSERT 성공 시: 1 (1줄 추가됨)
            UPDATE 성공 시: 1 (1줄 수정됨)
            DELETE 성공 시: 1 (1줄 삭제됨)
            실패 혹은 무시(IGNORE) 시: 0 (바뀐 게 없음)
            에러 발생 시: -1 (작업 자체가 안 됨)   
            **INSERT...UPDATE**는 "삽입"을 시도했다가 "수정"으로 선회한 것이니, 그 결과가 다르다는 것을 보여주기 위해 2를 주는 것입니다.
*/
INSERT INTO member (member_id, name, grade)
VALUES (9, '김개똥', 'VIP')
ON DUPLICATE KEY UPDATE 
    name = VALUES(name), 
    grade = VALUES(grade);
SELECT ROW_COUNT(); -- 결과값 2 출력됨
/* 결과: member_id가 이미 존재하면 name과 grade를 '제미니', 'VIP'로 수정합니다. 존재하지 않는다면 새로 추가합니다
   9	홍길서	38	M	500	VIP	2025-01-01 (변경전)
   9	제미니	38	M	500	VIP	2025-01-01 (변경후)
*/


-- 10. 회원이 없으면 추가하고, 있으면 포인트를 100 증가시키시오.
INSERT INTO member (member_id,name,age,gender,point)
VALUES (2,'김중복',35,'F',100)
ON DUPLICATE KEY UPDATE point = point + 100;
-- 11. board 테이블의 특정데이터를 복사하여 새 게시글로 추가하시오.
INSERT INTO board (title,writer,regdate)
SELECT title,writer,CURDATE()
FROM board
WHERE board_no = 3; -- board_no = 3 인행을 복사 새게시글로 추가

-- 12. 주문 금액이 100000 이상인 주문만 새로운 주문으로 복사하시오.
INSERT INTO orders (member_id,total_price,status,order_date)
SELECT member_id,total_price,status,order_date
FROM orders
WHERE total_price >=200000;

SELECT ROW_COUNT();
-- 13. 모든 필수 컬럼을 포함하여 상품을 추가하시오.
INSERT INTO product(product_name,price,stock,category)
VALUES ('스마트폰',800000,20,'전자제품');
-- 14. 트랜잭션을 사용하여 회원을 추가하시오.
/*
    START TRANSACTION -- 트랜젝션 시작
    INSERT문
    COMMIT(승인) | ROLLBACK(취소)
*/
START TRANSACTION;
INSERT INTO member (member_id,name,age,gender,point)
VALUES (NULL,'TRANSACTION',25,"F",500);
COMMIT;
ROLLBACK;
-- 15. member 테이블의 데이터를 백업 테이블에 저장하시오.
/*두 테이블의 열배치가 동일해야 한다.*/
select *  FROM member_backup;
INSERT INTO member_backup
SELECT * FROM member; 