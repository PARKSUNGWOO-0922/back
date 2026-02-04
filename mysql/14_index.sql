/*
    1. 뷰(View)의 근본 개념: "쿼리 저장소"
    아까 WITH 절에서 만든 변수는 **쿼리가 끝나면 사라지는 '일회용'**이었죠? 
    **뷰(View)**는 그 변수를 아예 데이터베이스에 **'저장'**해두고, 
    원할 때마다 언제든 꺼내 쓸 수 있게 만든 것입니다.

    CTE (WITH): 포스트잇에 적어둔 임시 메모 (보고 버림)
    뷰 (VIEW): 정식으로 인쇄해서 게시판에 붙여둔 공고문 (언제든 다시 봄)

    2. 기초 문법: 이름 붙여 저장하기
    만드는 법도 정말 간단해요. 
    아까 짠 코드를 그대로 가져와서 앞에 딱 한 줄만 붙이면 됩니다.

    CREATE VIEW v_dept_avg AS  -- "v_dept_avg라는 이름의 뷰를 만들겠다!"
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee
    GROUP BY dept_id;

    3. 왜 뷰를 쓰나요? (전망대 효과)
    뷰를 영어 뜻 그대로 **'경치(View)'**라고 생각해보세요.

    - 복잡함은 숨기고 결과만 보기: 매번 복잡한 JOIN이나 GROUP BY를 치기 귀찮을 때,
        딱 결과만 보여주는 '전망대'를 하나 세워두는 거예요. 
        그다음부터는 이렇게만 검색하면 됩니다.

        SELECT * FROM v_dept_avg; (마치 진짜 테이블처럼요! ㅋ)

    - 보안 (필요한 것만 보여주기): 아르바이트생에게 직원 명단을 보여줘야 하는데, 
        월급 정보는 숨기고 싶다면? 월급 컬럼만 쏙 뺀 뷰를 만들어서 
        그것만 볼 수 있게 권한을 주면 됩니다.
    
    4. 가장 중요한 특징: "가상 테이블"
    뷰는 데이터를 따로 저장하지 않습니다. 
    그냥 "어떻게 데이터를 가져올 것인가" 하는 **방법(쿼리문)**만 저장하고 있어요.
    그래서 원본 테이블(employee)의 데이터가 바뀌면, 
    뷰를 열었을 때 나오는 데이터도 자동으로 최신화됩니다!



    ------나머지는 복사해~
*/

DROP TABLE member;

CREATE TABLE member (
  member_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  age INT,
  gender CHAR(1),
  point INT,
  salary INT,
  grade VARCHAR(20),
  regdate DATE
);

INSERT INTO member VALUES
(1, 'Hong Gildong', 35, 'M', 500, 3000000, 'VIP', '2023-01-01'),
(2, 'Yi Sunsin', 22, 'M', 200, 2500000, 'BRONZE', '2022-01-01'),
(3, 'Kim Younghee', 19, 'F', NULL, 1800000, 'BRONZE', '2025-01-01'),
(4, 'Park Cheolsu', 45, 'M', 900, 5000000, 'GOLD', '2021-01-01'),
(5, 'Choi Minsu', 31, 'F', 700, NULL, 'SILVER', '2024-01-01');

-- 1. member 테이블의 name 컬럼에 인덱스를 생성하시오.
CREATE INDEX idx_member_name ON member(name);
-- 2. member 테이블에 생성된 모든 인덱스를 확인하시오.
SHOW INDEX FROM member;
-- 3. 중복되면 안 되는 값(예: 회원 이름이 유일하다고 가정)에 대해 name 컬럼에 UNIQUE 인덱스를 생성하시오.
CREATE UNIQUE INDEX idx_member_name_unique ON member(name);
-- 4. gender와 age 컬럼을 묶은 복합 인덱스를 생성하시오.
CREATE INDEX idx_member_gender_age ON member(gender, age);
-- 5. age 값을 기준으로 회원을 조회하는 SQL을 작성하시오.
SELECT *
FROM member
WHERE age=35;
-- 6. name 컬럼에 함수가 적용되어 인덱스를 사용할 수 없는 조회 SQL을 작성하시오.
SELECT *
FROM member
WHERE UPPER(name)='HONG GILDONG';
-- 7. 실행 계획을 확인하여 name 인덱스 사용 여부를 판단하시오.
EXPLAIN
SELECT *
FROM member
WHERE name='Hong Gildong';
-- 8. name 컬럼에 생성한 인덱스를 삭제하시오.
DROP INDEX idx_member_name ON member;
-- 9. member 테이블의 기본 키가 자동으로 생성한 인덱스를 확인하시오.
SHOW INDEX
FROM member
WHERE Key_name='PRIMARY';
-- 10. 다음과 같은 조회가 자주 발생한다고 가정한다. 
SELECT *
FROM member
WHERE regdate>='2024-01-01'
ORDER BY regdate DESC;
-- 10-1 이 쿼리를 빠르게 하기 위한 인덱스를 생성하시오.
CREATE INDEX idx_member_regdate ON member(regdate);